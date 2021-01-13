
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술자리 메인페이지</title>
 <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/slick.css">
    <!-- Bootstrap cdn 설정 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <!-- script -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/scrolla.jquery.min.js"></script>
    <script src="resources/js/script.js"></script> <!-- script.js 파일 적용 -->
    <script src="resources/js/slick.min.js"></script> <!-- slick.min.js 파일적용-->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">


</head>
<body>
	<div class="wrap">
      <%@include file="/WEB-INF/views/common/header.jsp" %>

        <section class="carousel">

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">

                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/image/carousel1.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/carousel2.jpg" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/carousel3.jpg" alt="" style="width:100%;">
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>

        <section class="new_product">

            <span>
                <h2 style="text-align: center; margin: 80px;"> 오늘의 신상품 <span>
                <a href="/basicSool.sool" style="float:right; cursor: pointer; text-decoration: none;  font-size:20px; margin-top:65px; ">더보기 </a>
                </span>
                </h2>
            </span>

            <div class="new-Plist">
                <ul class="nList">

                    <li class="newList-li">
                        <a href="#">
                            <div class="newImg-wrap">

                                <img src="resources/image/product.jpg" style="width: 100%;">
                            </div>

                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">시나브로 에뚜왈 화이트 </h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>

                                <div class="gray"><span class="price">10,000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="newList-li">
                        <a href="#">
                            <div class="newImg-wrap">


                                <img src="resources/image/product.jpg" style="width: 100%;">
                                <button type="button" class="btn_like">
                                    <span class="img_emoti">좋아요</span>
                                    <span class="ani_heart_m"></span>
                                </button>
                           </div>
                            <div class="text-box" style="padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="newList-li">
                        <a href="#">
                            <div class="newImg-wrap">

                                <img src="resources/image/product.jpg" style="width:100%;">
                            </div>
                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>
                    </li>

                    <li class="newList-li">
                        <a href="#">
                            <div class="newImg-wrap">


                                <img src="resources/image/product.jpg" style="width: 100%;">

                            </div>
                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                    <button type="button" class="btn_like">
                                        <span class="img_emoti">좋아요</span>
                                        <span class="ani_heart_m"></span>
                                    </button>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>

                    </li>

                </ul>
            </div>
        </section>

        <section class="best_product">

            <span>
                <h2 style="text-align: center; margin: 80px;"> 베스트 상품 <span><a  href="/basicSool.sool"  style="float:right;  font-size:20px; margin-top:35px;cursor: pointer; text-decoration: none; margin-top:65px;" >더보기 </a></span></h2>
            </span>
            <div class="best-Plist">
                <ul class="bList">

                    <li class="bestList-li">
                        <a href="#">
                            <div class="newImg-wrap">

                                <img src="resources/image/product.jpg" style="width: 100%;">
                            </div>

                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="bestList-li">
                        <a href="#">
                            <div class="newImg-wrap">


                                <img src="resources/image/product.jpg" style="width: 100%;">
                            </div>
                            <div class="text-box" style="padding: 10px; box-sizing: border-box;
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="bestList-li">

                        <a href="#">
                            <div class="newImg-wrap">

                                <img src="resources/image/product.jpg" style="width: 100%;">
                            </div>
                            <div class="text-box" style="padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="bestList-li">
                        <a href="">
                            <div class="newImg-wrap">


                                <img src="resources/image/product.jpg" style="width: 100%;">
                            </div>
                            <div class="text-box" style="padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">전통주1</h4>
                                    </span>
                                    <div class="star">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i>
                                        </span>

                                    </div>
                                </div>
                                <div class="gray"><span class="price">10000원</span></div>

                            </div>
                        </a>
                    </li>


                </ul>
            </div>
        </section>


        <section class="subscribe">
            <div class="subs-image">
                <img src="resources/image/subscribe.png" alt="">
            </div>

            <div class="sub-text">
                <h2>담화박스</h2>
                <span>
                    지금 바로 구독신청하고 <br>전국각지 양조장의 다양한
                    전통주를 경험하세요
                </span>
                <button type="button" id="subs_button" class="btn btn-danger btn-lg" onclick="location.href='/subscribe.sool'">구독하기</button>
            </div>


        </section>

 <%@include file="WEB-INF/views/common/footer.jsp" %>
     
    </div>
</body>
</html>


<script>
    
  
    
    /* 캐러셀 */
       $(function(){
        // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
        $('#carousel-example-generic').carousel({
        // 슬리아딩 자동 순환 지연 시간
        // false면 자동 순환하지 않는다.
        interval: 5000,
        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
        pause: "hover",
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: true,
        // 키보드 이벤트 설정 여부(?)
        keyboard : true
        });
        });
       
    
 

   
    /* 좋아요*/

    
    
    
$('.btn_like').click(function(){
  if($(this).hasClass('btn_unlike')){
    $(this).removeClass('btn_unlike');
    $('.ani_heart_m').removeClass('hi');
    $('.ani_heart_m').addClass('bye');
  }
  else{
    $(this).addClass('btn_unlike');
    $('.ani_heart_m').addClass('hi');
    $('.ani_heart_m').removeClass('bye');
  }
});
</script>
