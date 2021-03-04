---
title: Vue中使用video.js和flv.js处理直播流
date: 2018/12/15
tags:
 - Vue
 - video
categories:
 - Vue
---

> 支持hls、http-flv、rtmp（低版本chrome支持、高版本禁用了flash）

## 预览

<img :src="$withBase('/vue-video/hls.png')" alt="project"></img>

## 代码

``` vue
<template>
  <video
    ref="videoPlayer"
    width="100%"
    height="100%"
    class="video-js vjs-default-skin vjs-big-play-centered"
  >
    Your browser is too old which doesn't support HTML5 video.
  </video>
</template>

<script>
import videojs from 'video.js'
import 'video.js/dist/video-js.css' // video样式
import 'videojs-flash' // flash插件，低版本chrome可用，88.110版本已不支持flash
import flvjs from 'flv.js' // http-flv格式的直播流需要使用flvjs兼容

export default {
  name: 'VideoPlayer',
  props: {
    source: {
      type: String,
      default: '',
      required: true
    },
    type: {
      type: String,
      default: 'video/mp4',
      required: true
    }
  },
  data () {
    return {
      player: null,
      options: {
        controls: true, // 是否显示控制条
        poster: '', // 视频封面图地址
        preload: 'auto',
        autoplay: true,
        fluid: true, // 自适应宽高
        isLive: true, // 是否直播
        language: 'zh-CN', // 设置语言
        muted: false, // 是否静音
        playbackRates: [1, 1.25, 1.5, 2], // 倍速播放
      },
    }
  },
  mounted () {
    this.$nextTick(() => {
      this.init(this.source, this.type)
    })
  },
  beforeDestroy () {
    this.dispose()
  },
  methods: {
    // 销毁player
    dispose () {
      if (this.player && this.player.dispose) {
        this.player.dispose()
      }
    },
    init (src, type) {
      const that = this
      if (this.player) {
        this.player.src([{ src, type }])
        return
      }
      this.player = videojs(
        this.$refs.videoPlayer,
        {
          ...this.options,
          sources: [{ src, type }]
        },
        function onPlayerReady () {
          this.on('error', () => {
            // 对于videojs不支持的流（flv）使用flvjs
            if (flvjs.isSupported()) {
              that.player = flvjs.createPlayer({
                type: 'flv',
                url: that.source
              })
              that.player.attachMediaElement(that.$refs.videoPlayer)
              that.player.play()
            }
          })
        })
    }
  },
  watch: {
    source: function (newSource) {
      this.init(newSource, this.type)
      return newSource
    }
  }
}
</script>
```

## 参考文档

* [video.js官方文档](https://docs.videojs.com/index.html)
* [video.js Github](https://github.com/videojs/video.js)
* [flv.js Github](https://github.com/bilibili/flv.js)
