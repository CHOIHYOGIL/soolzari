//스크롤 애니메이션

$(function(){    /* 외부파일로 작성하니까 반드시 $(function(){}); 으로 감싸주고 그 안에 작성*/
    
    $('.animate').scrolla({     /* animate 클래스에 scrolla를 적용해라 중괄호안에는 옵션적용*/
        
        mobile:true,  /* 모바일 시 활성화*/
        once:false   /* 스크롤 시 딱한번만 실행할때는 true, 스크롤할때마다 적용될거면 true*/
    })
})

//헤더이벤트
var scrollValue=0;
                            /* document는 웹페이지 객체로 웹페이지 자체를 의미하며 scrollTop은 스크롤바의 수직위치 반환*/
scrollValue= $(document).scrollTop();  /* scroll 위치에 top (위쪽) 위치를 scrollValue에 저장*/
fixHeader();

$(window).on('scroll resize', function(){  /* scroll 되고 윈도우 크기가 변할 때 함수 실행*/
    scrollValue=$(document).scrollTop();
    fixHeader();
})

/* 고정 헤더함수*/

function fixHeader(){
    
    if(scrollValue> 200){
        $('header').addClass('on');
    }else{
        $('header').removeClass('on');
    }
}



//슬라이드 이벤트 걸기

//script.js라는 외부파일에 작성하기 때문에 $(function())으로 감싸줘야 한다.
$(function(){
    
    //적용할 클래스에 slick적용
    $('.imageSlide .slide').slick({
        
        arrows: false, // 화살표 사용 x
        dots:true,   //스크롤바 아래 점으로 페이지네이션 여부
        autoplay:true, //자동 스크롤 재생
        fade:true,  //페이드인 효과
        autoplaySpeed :5000,//재생시간 5초
        pauseOnHover : false, //마우스를 호버시켰을때 슬라이드가 멈추지 않도록
        pauseOnFocus:false,    //마우스 포커스 됐을때 슬라이드가 멈추지 않도록
      slidesToShow: 1, 
        slidesToScroll: 1

        
        
    });
})

