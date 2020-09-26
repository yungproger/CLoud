<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 16.09.2020
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp"%>
<h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900" style="text-align: center">All files</h1>
    <div class="container mx-auto flex flex-col px-5 py-24 justify-center items-center">
             <div class="flex w-full justify-center">
                <input class="border-0 bg-gray-100 rounded mr-4 border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 lg:w-full xl:w-1/2 w-2/4 md:w-full" placeholder="Placeholder" type="text">
                <button class="inline-flex text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">Search</button>
            </div>
    </div>
<section class="text-gray-700 body-font">
        <div class="lg:w-2/3 w-full mx-auto overflow-auto">
            <table class="table-auto w-full text-left whitespace-no-wrap">
                <thead>
                <tr>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl">Name</th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Size</th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Sdkjd</th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200">Jkksmm</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="px-4 py-3">Start</td>
                    <td class="px-4 py-3">5 Mb/s</td>
                    <td class="px-4 py-3">15 GB</td>
                    <td class="px-4 py-3 text-lg text-gray-900">Free</td>
                    </td>
                </tr>
                <tr>
                    <td class="border-t-2 border-gray-200 px-4 py-3">Pro</td>
                    <td class="border-t-2 border-gray-200 px-4 py-3">25 Mb/s</td>
                    <td class="border-t-2 border-gray-200 px-4 py-3">25 GB</td>
                    <td class="border-t-2 border-gray-200 px-4 py-3 text-lg text-gray-900">$24</td>
                    </td>
                </tr>
                <tr>
                    <td class="border-t-2 border-gray-200 px-4 py-3">Business</td>
                    <td class="border-t-2 border-gray-200 px-4 py-3">36 Mb/s</td>
                    <td class="border-t-2 border-gray-200 px-4 py-3">40 GB</td>
                    <td class="border-t-2 border-gray-200 px-4 py-3 text-lg text-gray-900">$50</td>
                    </td>
                </tr>
                <tr>
                    <td class="border-t-2 border-b-2 border-gray-200 px-4 py-3">Exclusive</td>
                    <td class="border-t-2 border-b-2 border-gray-200 px-4 py-3">48 Mb/s</td>
                    <td class="border-t-2 border-b-2 border-gray-200 px-4 py-3">120 GB</td>
                    <td class="border-t-2 border-b-2 border-gray-200 px-4 py-3 text-lg text-gray-900">$72</td>
                    </td>
                </tr>
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
<%@include file="footer.jsp"%>
</body>
</html>
