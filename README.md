Matchismo
=========

###CS193p Demo

iOS学习，纸牌游戏，作业
###游戏说明：
纸牌匹配游戏，有2张牌和3张牌两种模式，玩家翻开2张或3张牌后，如果期中有两张花色或者点数相同则认为该组纸牌匹配成功，并获得相应的分数，如果没有匹配成功则扣除相应的分数。
###任务分组：
1. 灰灰 颖颖：界面设计
2. 帆帆 sixer：编码
3. 雪球：测试

##### 2015年11月20日 
改进纸牌匹配的算法，理论可以兼容多种模式

##### 2014年06月19日 
1. 根据Lecture 6的内容，将CardGameViewController抽象化，并增加具体实现CardGameViewController

##### 2014年06月18日 
1. 完成Assignment 2的Task 5，通过label显示用户的操作
2. 重新改进了match算法，解决在3-card模式下，已选的两张牌无法匹配的问题
3. 完成Task 6，增加纸牌数量为30张

P.S. 3月报名驾考，昨天拿到驾照了！！！终于不用请假了，不用起早了，不用担心挂科了，不用跑很远的地方练车了。。。最重要的是赶在了夏至前。。。。


##### 2014年06月10日 
1. 完成Assignment 2的Task 1~3
2. 解决重新开始4次后，无法翻牌的BUG，原因为_deck没有置空，导致后面无牌可取，每次重新开始游戏后置空，从而触发初始化新的deck，通过断点调试解决

##### 2014年06月08日 
1. 动态绑定以及id类型的应用
2. Foundation框架中的常用对象、属性列表、使用NSUserDefault存储、带属性的文本等等


---------------------
说明：

+ 2-card mode:每次最多只允许选择2张牌，花色或者点数匹配即可，否则翻回上一张牌
+ 3-card mode:每次最多允许选择3张牌，其中两张以上的牌的花色或点数匹配即可，否则翻回头两张牌