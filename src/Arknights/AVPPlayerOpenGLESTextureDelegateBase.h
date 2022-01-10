//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

#import "AVPPlayerTextureDelegate.h"

@class EAGLContext, NSString;

@interface AVPPlayerOpenGLESTextureDelegateBase : NSObject <AVPPlayerTextureDelegate>
{
    EAGLContext *_eaglContext;
    struct __CVOpenGLESTextureCache *_cache;
}

@property(readonly, nonatomic) struct __CVOpenGLESTextureCache *cache; // @synthesize cache=_cache;
- (void).cxx_destruct;
- (unsigned int)createShaderProgramWithShaders:(id)arg1 bindings:(id)arg2;
- (unsigned int)createShaderProgramFromVertexShader:(unsigned int)arg1 fragmentShader:(unsigned int)arg2;
- (unsigned int)compileFragmentShaderSource:(id)arg1;
- (unsigned int)compileVertexShaderSource:(id)arg1;
- (unsigned int)compileShader:(unsigned int)arg1 source:(id)arg2;
- (id)pixelBufferAttributes:(_Bool)arg1;
- (void)renderPlayerTexture:(id)arg1;
- (void)updatePlayerTexture:(id)arg1 fromPixelBuffer:(struct __CVBuffer *)arg2;
- (void)freePlayerTexture:(id)arg1;
- (id)createPlayerTexture;
- (void)createPlatformResources;
- (void)dealloc;
- (id)init;
- (unsigned int)formatForPixelBuffer:(struct __CVBuffer *)arg1 plane:(int)arg2;
- (int)internalFormatForPixelBuffer:(struct __CVBuffer *)arg1 plane:(int)arg2;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
