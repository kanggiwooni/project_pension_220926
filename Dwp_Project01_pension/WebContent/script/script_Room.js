$(function(){	
    
	setInterval(fnSlide,3000);
	
});
	function fnSlide(){
	    $("div.pansionSlideShowImg").animate({
	        "margin-left" : "-640px"
	    },1500,function(){
	        $("div.pansionSlideShowImg>img:first-child")
	        .insertAfter("div.pansionSlideShowImg>img:last-child")
	        $("div.pansionSlideShowImg").css({
	            "margin-left" : "0px"
	        });
	    });
	}

	function fnSlide_next(){
	    $("div.pansionSlideShowImg>img:first-child")
	    .insertAfter("div.pansionSlideShowImg>img:last-child");
	}
	
	function fnSlide_prev(){
	    $("div.pansionSlideShowImg>img:last-child")
	    .insertBefore("div.pansionSlideShowImg>img:first-child");
	}

