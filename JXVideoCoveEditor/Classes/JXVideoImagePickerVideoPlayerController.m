//
//  JXVideoImagePickerVideoPlayerController.m
//  JXVideoImagePicker
//
//  Created by mac on 17/5/17.
//  Copyright © 2017年 Mr.Gao. All rights reserved.
//

#import "JXVideoImagePickerVideoPlayerController.h"

@interface JXVideoImagePickerVideoPlayerController ()

// 1、创建要播放的元素
@property(nonatomic, strong) AVPlayerItem *playerItem;
// 2、创建播放器
@property(nonatomic, strong) AVPlayer *player;
//3、创建视频显示的图层
@property(nonatomic, strong) AVPlayerLayer *playerLayer;

@property(nonatomic, assign) CMTimeScale timeScale;



@end


@implementation JXVideoImagePickerVideoPlayerController
#pragma mark - lazy loading
- (CMTimeScale)timeScale{
    if (!_timeScale) {
        _timeScale = self.asset.duration.timescale ? self.asset.duration.timescale : 600;
    }
    return _timeScale;
}

- (AVPlayerItem *)playerItem{
    if (_playerItem == nil) {
        _playerItem = [AVPlayerItem playerItemWithAsset:self.asset];
    }
    return _playerItem;
}

- (AVPlayer *)player{
    if (_player == nil) {
        _player = [AVPlayer playerWithPlayerItem:self.playerItem];
        
        
    }
    return _player;
}

- (AVPlayerLayer *)playerLayer{
    if (_playerLayer == nil) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.frame = self.view.bounds;
        
    }
    return _playerLayer;
}


#pragma mark - life cycle

- (void)loadView{
    [super loadView];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer addSublayer: self.playerLayer];
    
//    [self.player play];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


#pragma mark - 公告方法

//  想要定格的时间
- (void)seekToTime:(CMTime)time{

    
    [self.player seekToTime:time toleranceBefore:CMTimeMake(0, self.timeScale) toleranceAfter:CMTimeMake(0, self.timeScale)completionHandler:^(BOOL finished) {
        
    }];
}


@end


