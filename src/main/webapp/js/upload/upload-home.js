$(function () {
    var imgCount = 5;
    var index = 1;
    var intervalId;
    var buttonSpan = $('.trig')[0].children; //htmlCollection 集合
    //自动轮播功能 使用定时器
    autoNextPage();
    function autoNextPage() {
        intervalId = setInterval(function() {
            nextPage(true);
        }, 3000);
    }
    //当鼠标移入 停止轮播
    $('.panel').hover(function() {
        console.log('hah');
        clearInterval(intervalId);
    }, function() { // 当鼠标移出，开始轮播
        autoNextPage();
    });
    //小圆点的相应功能 事件委托
    clickButtons();

    function clickButtons() {
        var length = buttonSpan.length;
        for(var i = 0; i < length; i++) {
            buttonSpan[i].onclick = function() {
                $(buttonSpan[index - 1]).removeClass('on');
                if($(this).attr('index') == 1) {
                    index = 5;
                } else {
                    index = $(this).attr('index') - 1;
                }
                nextPage(true);
            };
        }
    }
    function nextPage(next) {
        var targetLeft = 0;
        //当前的圆点去掉on样式
        $(buttonSpan[index - 1]).removeClass('on');
        if(next) { //往后走
            if(index == 5) { //到最后一张，直接跳到第一张
                targetLeft = 0;
                index = 1;
            } else {
                index++;
                targetLeft = -620 * (index - 1);
            }
        } else { //往前走
            if(index == 1) { //在第一张，直接跳到第五张
                index = 5;
                targetLeft = -620 * (imgCount - 1);
            } else {
                index--;
                targetLeft = -620 * (index - 1);
            }
        }
        $('.carousel-module .panel .pic').animate({
            left: targetLeft + 'px'
        });
        //更新后的圆点加上样式
        $(buttonSpan[index - 1]).addClass('on');
    }
})