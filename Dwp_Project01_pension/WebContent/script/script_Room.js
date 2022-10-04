$(function(){

    setInterval(fnSlide,4000);

    function fnSlide(){
        $("div#pansionSlideShowImg").animate({
            "margin-left" : "-640px"
        },2000,function(){
            $("div#pansionSlideShowImg>img:first-child")
            .insertAfter("div#pansionSlideShowImg>img:last-child")
            $("div#pansionSlideShowImg").css({
                "margin-left" : "0px"
            });
        });
    }
});