/***
 * 标题：图片滚动插件
 * 编写时间：2015年3月18号
 * 作者：斯迈欧
 * 邮箱：hhloyyhhl@qq.com
 * 工作室网站：http://www.agevisual.com/
 * version:jquery.ScrollPic.1.0
 ***/
 $(function () {
    $.fn.ScrollPic = function (option) {
        return this.each(function () {
            var defaults = {
                ele: '.yiz-slider-1',
                Time: '5000000',
                speed: '200',
                autoscrooll: false,
                arrowcontrol: false,
                numbercontrol: false
            };

            var opts = $.extend({}, defaults, option);
            var PicObject = $(this);
            var scrollList = PicObject.find('ul');
            var listLi = scrollList.find('li');


            var index = 0;
            var picTimer;
            var time = 0;
            var pWidth = PicObject.width()
            var pHeight = PicObject.height()
            var len = PicObject.find("li").length;
            var sWidth = scrollList.find('li').width();
            listLi.css({ "width": pWidth, "height": pHeight })
            listLi.find('img').css({ "width": pWidth, "height": pHeight })
            scrollList.css("width", pWidth * len)
            function picTimer() {
                index++;
                if (index == len) { index = 0; }
                showPics(index);
            }//自动切换函数
            
            //if (opts.autoscrooll) { var time = setInterval(picTimer, opts.Time) } else { $(".yiz-page-btn").hide() }
            $(".yiz-page-btn").hide();

            function showPics(index) {
                var nowLeft = -index * pWidth;
                PicObject.find(scrollList).stop(true, false).animate({ "left": nowLeft }, opts.speed);
                //PicObject.find(paging).eq(index).addClass('current').siblings().removeClass('current');
            }//动画函数
            

            /*
            if (opts.numbercontrol) {
                PicObject.append('<div class="yiz-page-btn"></div>')
                for (i = 1; i <= len; i++) {
                    PicObject.find('.yiz-page-btn').append('<span>' + i + '</span>')
                }
                var paging = PicObject.find(".yiz-page-btn span");
                paging.eq(index).addClass('current')
                PicObject.find(paging).on('touchstart mouseover',function (e) {
                   e.preventDefault()
                   index = PicObject.find(paging).index($(this));
                   showPics(index)
                });//鼠标经过1、2、3、4的效果
            }
            */

            if (opts.arrowcontrol) {
                PicObject.append('<span class="yiz-leftarrow"></span><span class="yiz-rightarrow"></span>')
                var prev = PicObject.find('span.yiz-leftarrow');
                var next = PicObject.find('span.yiz-rightarrow');
                prev.on('click',function (e){
                    e.preventDefault()
                    index -= 1;
                    if (index == -1) { index = len - 1; }
                    showPics(index);
                });//上一页

                next.on('click',function (e){
                    e.preventDefault()
                    index += 1;
                    if (index == len) { index = 0; }
                    showPics(index);
                });//下一页

                
            }
            PicObject.on('touchstart mouseover',function (e) {
                clearInterval(time);
            })
            PicObject.on('mouseleave',function (e) {
                //if (opts.autoscrooll) { time = setInterval(picTimer, opts.Time); } else { clearInterval(time); PicObject.find('$(".yiz-page-btn")').hide() }
                clearInterval(time); 
                //PicObject.find('$(".yiz-page-btn")').hide();
            });//清除计时器

           //phone
           

            //支持手势事件
            function isTouchDevice() {  
                try {  //phone
                    document.createEvent("TouchEvent"); 
                    var startX = 0,endX = 0;   
                    PicObject.on('touchstart',function(e){
                      e.preventDefault()
                      var touch = event.touches[0];
                               startX = touch.pageX;
                  })
                    PicObject.on('touchmove',function(e){
                       var touch2 = event.touches[0];
                               endX = touch2.pageX;
                        if(startX==endX){
                            return
                        }
                       if(!scrollList.is(":animated")){ 
                          e.preventDefault()

                         
                        if(startX>endX+100){
                          index += 1;
                          if (index == len) { index = 0; }
                          showPics(index);
                          (startX=endX+100)
                      }
                      if(startX<endX-100){
                         index -= 1;
                         if (index == -1) { index = len - 1; }
                         showPics(index);
                         (startX=endX-100)
                     }
                 }
             })
                    PicObject.on('touchend',function(e){
                        time = setInterval(picTimer, opts.Time)
                    })


                    
                }  
                catch (e) {  //pc

                }  
            }  
            isTouchDevice()

        })
}

});

