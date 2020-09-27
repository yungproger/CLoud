<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 15.09.2020
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<%-- Main Page --%>

<%@include file="header.jsp"%>
<section class="text-gray-700 body-font">
    <div class="container px-5 py-24 mx-auto">
        <div class="flex flex-col text-center w-full mb-20">
            <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">DADCloud online repository</h1>
            <p class="lg:w-2/3 mx-auto leading-relaxed text-base">The site is designed to store your files. You can use these functions:</p>
        </div>
        <div class="flex flex-wrap -m-3 text-center">
            <div class="p-3 md:w-1/3 sm:w-1/2 w-full">
                    <img src="img/folder.png" stroke-width="2" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 24 24">
                    <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Open folders</p>
            </div>
            <div class="p-3 md:w-1/3 sm:w-1/2 w-full">
                    <img src="img/folder_upload.png" stroke-width="2" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 24 24">
                    <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Save files in folders</p>
            </div>
            <div class="p-3 md:w-1/3 sm:w-1/2 w-full">
                    <img src="img/file_upload.png" stroke-width="2" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 24 24">
                    <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Upload file</p>
            </div>
        </div>
    </div>
</section>
</body>
</html>
