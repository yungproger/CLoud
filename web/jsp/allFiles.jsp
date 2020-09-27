<%@ page import="models.User" %>
<%@ page import="models.Folder" %>
<%@ page import="java.util.List" %>
<%@ page import="models.UserFile" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 16.09.2020
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    List<Folder> folders = new ArrayList<>();
    List<UserFile> files = new ArrayList<>();
%>
<%
    folders = (List<Folder>) request.getAttribute("folders");
    files = (List<UserFile>) request.getAttribute("files");
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
    }
    String pageString = page.getClass().getName().toString();

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
        <%-- Input for file search --%>
        <form class="flex w-full justify-center"  method="post" action="${pageContext.request.contextPath}/search">
            <input name="file" class="border-0 bg-gray-100 rounded mr-4 border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 lg:w-full xl:w-1/2 w-2/4 md:w-full" placeholder="Search..." type="text" style="width: 100%">
            <input class="inline-flex text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg" value="Search" style="width: 20%" type="submit">
        </form>
         <%-- Inputs for file upload and folder create--%>
        <div>
            <input class="p-2 md:w-1/2 sm:w-1/2 w-full" type="image" src="${pageContext.request.contextPath}/jsp/img/upload.png" style="width: 6%" style="display: block"id="img">
            <input class="p-2 md:w-1/2 sm:w-1/2 w-full" type="image" src="${pageContext.request.contextPath}/jsp/img/create_folder.png" style="width: 5%" style="display: block" id="fold" >
        </div>
    </div>
</div>
<div id="up" style="display: none; margin-right: 30%;width: 40% " class="lg:w-1/1 md:w-2/6 bg-gray-200 rounded-lg p-3 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
    <form action="${pageContext.request.contextPath}/fileUpload" method="post" enctype="multipart/form-data" >
        Select File:<input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" type="file" name="file" ><br/>
        <input type="submit" value="Upload">
    </form>
</div>
<div id="cre" style="display: none; margin-right: 30%; width: 40%" class="lg:w-1/1 md:w-2/6 bg-gray-200 rounded-lg p-3 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
    <form action="${pageContext.request.contextPath}/createFolder" method="post" >
        Enter name of folder:<input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" type="text" name="folder_name"/><br/>
        <input type="submit" value="Create">
    </form>
</div>
<br>
<section class="text-gray-700 body-font">
    <div class="lg:w-2/3 w-full mx-auto overflow-auto">

        <%-- Table for showing folders and files --%>
        <table class="table-auto w-full text-left whitespace-no-wrap">
            <thead>
            <tr>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-white text-sm bg-gray-200">Icon</th>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl">Name</th>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Size (MB)</th>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Download</th>
                <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Delete</th>

            </tr>
            </thead>
            <tbody>

            <%-- Showing all folders --%>
            <%
                if(folders!=null){
                    for(Folder folder : folders){
            %>
            <tr>
                <td class="px-4 py-3" style="width: 5%;"><img  src="${pageContext.request.contextPath}/jsp/img/folder2.jpg" alt="Folder"></td>
                <td class="px-4 py-3"><a href="<%=request.getContextPath()%>/LoadSub?id=<%=folder.getId()%>"><%=folder.getName()%></a></td>
                <td class="px-4 py-3"></td>
                <td class="px-4 py-3"></td>
                <td class="px-4 py-3"><a href="<%=request.getContextPath()%>/folderDelete?id=<%=folder.getId()%>">Delete</a></td>
            </tr>
            <%
                    }
                }
            %>

            <%-- Showing all files --%>
            <%
                if(files!=null){
                    for(UserFile file : files){
            %>
            <tr>
                <td class="px-4 py-3" style="width: 5%;"><img  src="${pageContext.request.contextPath}/jsp/img/file2.jpg" alt="File"></td>
                <td class="px-4 py-3"><%=file.getName()%></td>
                <td class="px-4 py-3"><%=(Integer.parseInt(file.getSize()))/1000%></td>
                <td class="px-4 py-3"><a href="<%=request.getContextPath()%>/fileDownload?id=<%=file.getId()%>">Download</a></td>
                <td class="px-4 py-3"><a href="<%=request.getContextPath()%>/fileDelete?id=<%=file.getId()%>">Delete</a></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="flex pl-4 mt-4 lg:w-2/3 w-full center-pill mx-auto">
        <p><%=pageString%></p>
    </div>
</section>
</body>
</html>
