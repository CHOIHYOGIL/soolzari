<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/sellerGoodsList.css">
</head>
<meta charset="UTF-8">
<h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 내 상품 목록 </h2>
<table class="table">
    <thead>
        <tr>
            <th scope="col">상품 번호</th>
            <th scope="col">상품 이름</th>
            <th scope="col">상품 가격</th>
            <th scope="col">상품 등록일</th>
            <th scope="col">선택</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td><a href="#">상품1</a></td>
            <td>1234</td>
            <td>2021-01-04</td>
            <td><input type="checkbox"></td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td><a href="#">상품2</a></td>
            <td>4321</td>
            <td>2021-01-04</td>
            <td><input type="checkbox"></td>
        </tr>
    </tbody>
</table>
<div id="main_sub">
    <div id="main_search">
        <form action="/notice/find.sool" method="post">
            <select name="search_type" style="margin-left: 10px;">
                <option value="week">제목</option>
                <option value="month">상품가격</option>
                <option value="all">전통주</option>
            </select>
            <input type="text" name="search" placeholder="검색할 내용을 적어주세요">
            <input type="submit" value="찾기">
        </form>
    </div>
    <div id="main_crud">
        <input type="button" value="선택 상품 삭제">
        <input type="button" style="margin-right:10px;" value="상품 등록하기">
    </div>
</div>
</html>