<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/sellerGoodsDetail.css">
</head>
<meta charset="UTF-8">
<h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 상품 상세보기 </h2>
<div id="goods_det">
    <div id="goods_det_con">
        <div id="goods_det_img">
            <img src="###" id="det_img">
        </div>
        <div id="goods_det_cons">
            <div id="goods_det_con_1">
                <span id="det_title">###</span><br>
                <span id="det_content">판매된 갯수 : ###개</span>
            </div>
            <div id="goods_det_con_2">
                <span id="det_score">평점 : ###/5.0</span><span id="det_revcnt"> [리뷰 갯수:###]</span><br>
                <span id="det_date">등록일 : ###</span>
            </div>
            <div id="goods_det_con_3">
                <span id="det_price_title">판매가격</span><br>
                <span id="det_price">###원</span>
            </div>
        </div>
    </div>

    <div id="goods_det_fix">
        <table style="border:1px solid black; width:100%;height: 100%;">
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">상품명</th>
                <td><input type="text"></td>
            </tr>
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">판매가</th>
                <td><input type="text"></td>
            </tr>
            <tr style="height:20%;">
                <td colspan="2"><input type="button" value="수정하기" style="width:100%; border:none; height:100%;background-color: #4d5075; color:white;"></td>
            </tr>
            <tr style="height:20%;">
                <td colspan="2"><input type="button" value="뒤로가기" style="width:100%; border:none; height:100%; background-color: #f7b8b4;"></td>
            </tr>
        </table>
    </div>
</div>

</html>
