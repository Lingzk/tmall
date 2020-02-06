<%--
  Created by IntelliJ IDEA.
  User: 91451
  Date: 2020/2/6
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function () {
        $("#addForm").submit(function () {
            if (checkEmpty("name", "属性名称"))
                return true;
            return false;
        });
    })
</script>

<html>
<head>
    <title>属性管理</title>
</head>
<body>

<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>
        <li class="active">属性管理</li>
    </ol>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thread>
                <tr class="success">
                    <th>ID</th>
                    <th>属性名称</th>
                    <th>编辑</th>
                    <th>删除</th>
                </tr>
            </thread>
            <tbody>
                <c:forEach var="p" items="${ps}">

                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td><a href="admin_property_edit?id=${p.id}"><span
                                class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a href="admin_property_delete?id=${p.id}"><span
                                class="glyphicon glyphicon-trash"></span></a></td>

                    </tr>

                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增属性</div>
        <div class="panel-body">
            <form id="addForm" action="admin_property_add" method="post">
                <table class="addTable">
                    <input type="hidden" name="cid" value="${c.id}">
                    <tr>
                        <td>属性名称</td>
                        <td><input type="text" name="name" id="name" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>

</body>
</html>
