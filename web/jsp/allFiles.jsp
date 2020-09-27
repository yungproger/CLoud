<%@ page import="models.User" %>
<%@ page import="models.Folder" %>
<%@ page import="java.util.List" %>
<%@ page import="models.UserFile" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 16.09.2020
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!

%>
<%
    User user = (User) session.getAttribute("user");
    List<Folder> folders = (List<Folder>) request.getAttribute("folders");
    List<UserFile> files = (List<UserFile>) request.getRequestDispatcher("files");
%>
<html>
<head>
    <title>Title</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet"><script src="https://code.jquery.com/jquery-3.5.1.js" crossorigin="anonymous"></script>
    <script>
        $( document ).ready(function() {
            var a = false;
            var b = false;
            $("#img").on("click", function () {
                if (a == false) {
                    $("#up").css("display", "block")
                    $("#cre").css("display", "none")
                    a = true;
                    b=false;
                } else {
                    $("#up").css("display", "none")
                    a = false;
                }
            });
            $("#fold").on("click", function () {
                if (b == false) {
                    $("#cre").css("display", "block")
                    $("#up").css("display", "none")
                    b = true;
                    a=false;
                } else {
                    $("#cre").css("display", "none")
                    b = false;
                }
            });
        });
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900" style="text-align: center">All files</h1>
<div class="container mx-auto flex flex-col px-5 py-24 justify-center items-center">
    <div class="flex w-full justify-center" style="margin-left: 50%">
        <form class="flex w-full justify-center"  method="post" action="">
            <input name="file" class="border-0 bg-gray-100 rounded mr-4 border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 lg:w-full xl:w-1/2 w-2/4 md:w-full" placeholder="Placeholder" type="text" style="width: 100%">
            <input class="inline-flex text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg" value="Search" style="width: 20%">
        </form>
        <div>
            <input class="p-2 md:w-1/2 sm:w-1/2 w-full" type="image" src="img/upload.png" style="width: 6%" style="display: block"id="img">
            <input class="p-2 md:w-1/2 sm:w-1/2 w-full" type="image" src="img/create_folder.png" style="width: 5%" style="display: block" id="fold">
        </div>
    </div>
</div>
<div id="up" style="display: none; margin-right: 30%;width: 40% " class="lg:w-1/1 md:w-2/6 bg-gray-200 rounded-lg p-3 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
    <form action="" method="post" enctype="multipart/form-data" >
        Select Folder:<input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" type="file" name="file"/><br/>
        <input type="submit" value="Upload">
    </form>
</div>
<div id="cre" style="display: none; margin-right: 30%; width: 40%" class="lg:w-1/1 md:w-2/6 bg-gray-200 rounded-lg p-3 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
    <form action="" method="post" enctype="multipart/form-data" >
        Enter name of folder:<input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" type="text" name="folder_name"/><br/>
        <input type="submit" value="Create">
    </form>
</div>
<br>
<section class="text-gray-700 body-font">
    <div class="lg:w-2/3 w-full mx-auto overflow-auto">
        <table class="table-auto w-full text-left whitespace-no-wrap">
            <thead>
            <tr>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl">Name</th>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Size</th>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Download</th>

            </tr>
            </thead>
            <tbody>
            <%
                if(folders!=null){
                    for(Folder folder : folders){
            %>
            <tr>
                <td class="px-4 py-3"><a href="<%=request.getContextPath()%>/LoadSub?id=<%=folder.getId()%>"><%=folder.getName()%></a></td>
                <td class="px-4 py-3"><%="Size"%></td>
                <td class="px-4 py-3"><%="Download link"%></td>
            </tr>
            <%
                    }
                }
            %>
            <%
                if(files!=null){
                    for(UserFile file : files){
            %>
            <tr>
                <td class="px-4 py-3"><%=file.getName()</td>
                <td class="px-4 py-3"><%=file.getSize()%></td>
                <td class="px-4 py-3"><%="Download link"%></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="flex pl-4 mt-4 lg:w-2/3 w-full mx-auto">
        <a class="text-indigo-500 inline-flex items-center md:mb-2 lg:mb-0">Learn More
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">
                <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
        </a>
    </div>
</section>
</body>
</html>
