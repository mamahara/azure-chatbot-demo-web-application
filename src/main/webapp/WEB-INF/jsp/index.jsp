<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Main Page</title>
</head>
<body ng-app="demo">
<hr/>
<div class="container" ng-controller="UserController">
    <div class="row">
        <label>User</label> <input type="text" ng-model="userDto.userName" class="input-sm spacing"/>
        <label>Skills</label> <input type="text" ng-model="skills" ng-list class="input-sm custom-width spacing"
                                     placeholder="use comma to separate skills"/>
        <button ng-click="saveUser()" class="btn btn-sm btn-info">Save User</button>
    </div>
    <hr/>
    <div class="row">
        <p>{{allUsers | json}}</p>
    </div>
    <hr/>
    <div class="row" ng-repeat="user in allUsers">
        <div class="">
            <h3>{{user.userName}}</h3>
            <span ng-repeat="skill in user.skillDtos" class="spacing">{{skill.skillName}}</span>
        </div>
    </div>
</div>
</body>
<script src="${contextPath}/resources/js/lib/angular.min.js"></script>
<script src="${contextPath}/resources/js/lib/ui-bootstrap-tpls-2.5.0.min.js"></script>
<script src="${contextPath}/resources/js/app/app.js"></script>
<script src="${contextPath}/resources/js/app/UserController.js"></script>
<script src="${contextPath}/resources/js/app/UserService.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/lib/bootstrap.min.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/app/app.css"/>
</html>