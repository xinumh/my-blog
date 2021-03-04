---
title: 2020面试
date: 2020/10/26
sidebar: 'auto'
tags:
 - 面试
categories:
 -  面试
---


## ES6新的特性

块级作用域、箭头函数、参数处理、解构赋值、Promise、内置对象api

## 介绍Promise

`pending`（进行中）、`fulfilled`（已成功）和`rejected`（已失败）

该构造函数接收两个函数作为参数，分别是`resolve`和`reject`。
当异步操作执行成功后，会将异步操作结果作为参数传入`resolve`函数并执行，此时 `Promise`对象状态从`pending`变为`fulfilled`；
失败则会将异步操作的错误作为参数传入`reject`函数并执行，此时 `Promise`对象状态从`pending`变为`rejected`；

## Promise有几个状态

## 说一下闭包

能够读取其他函数内部变量的函数；

优点：作用域里的 变量,在函数执行完之后依旧保持没有被垃圾回收处理掉

缺点：闭包会导致内存占用过高，内存没有释放

## React的生命周期

Constructor()

componentWillMount()

Render()

componentDidMount组件已经被渲染到 DOM 中后运行

## componentWillReceiveProps的触发条件是什么

对比新旧props

shouldComponentUpdate()

是否要继续执行render方法，可以用PureComponent替代，比较state和props

componentDidUpdate() UI更新时调用

componentWillUnmount

## React16.3对生命周期的改变

引入了两个新的生命周期函数： `getDerivedStateFromProps`，`getSnapshotBeforeUpdate`

## 介绍下React的Filber架构

v15版本之前同步计算和对比virtrual dom，更新dom树很深的时候，页面性能就会不好；

破解同步操作时间过长的问题，分片。优先做紧急的事。更加紧密的处理机制，比线程还细。

React Fiber是对核心算法的一次重新实现



Reconciliation Phase1

- componentWillMount
- componentWillReceiveProps
- shouldComponentUpdate
- componentWillUpdate

render()

commit Phase2

- componentDidMount
- componentDidUpdate
- componentWillUnmount

使用React Fiber之后，一定要检查一下第一阶段相关的这些生命周期函数，看看有没有逻辑是假设在一个更新过程中只调用一次。componentWillMount和componentWillUpdate重点关注。

从React 15 到 React 16 ，对于DOM节点的渲染实现了3个方面的优化：

- React通过virtual DOM减少了实际改动真实DOM的开销
- 通过Diff算法减少了实际渲染的频次与变动范围
- 通过Fiber重构来改变这种不可控的现状，进一步提升交互体验，在用户态单线程条件下实现类似多进程的系统级别调度

画Filber渲染树

![preview](https://pic3.zhimg.com/v2-ee3dfa5fb83befb30faae5671c14492d_r.jpg)

## 介绍React高阶组件

React 中用于复用组件逻辑的一种高级技巧。

HOC 通过将组件*包装*在容器组件中来*组成*新组件。

常见：redux（connect）

## 父子组件之间如何通信

## Redux怎么实现属性传递，介绍下原理

## React-Router版本号

## 网站SEO怎么处理

## 介绍下HTTP状态码

## 403、301、302是什么

## 缓存相关的HTTP请求头

## 介绍HTTPS

## HTTPS怎么建立安全通道

## 前端性能优化（JS原生和React）

## 用户体验做过什么优化

## 对PWA有什么了解

## 对安全有什么了解

## 介绍下数字签名的原理

## 前后端通信使用什么方案

## RESTful常用的Method

## 介绍下跨域

## Access-Control-Allow-Origin在服务端哪里配置

## csrf跨站攻击怎么解决

## 前端和后端怎么联调