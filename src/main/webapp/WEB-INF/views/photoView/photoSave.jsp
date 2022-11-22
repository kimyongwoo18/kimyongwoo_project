<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-22
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/js/bootstrap.bundle.js">
<html>
<head>
    <title>PhotoSave</title>
    <%--이 페이지에서는 사진을 한장씩 올리고 그 사진에 대한 이름과 설명글을 적고
    카메라 브랜드, 모델, 렌즈정보를 적어내고, 셔속, iso, 조리개값, 화각을 메타데이터로 받는 기능을 넣겠다.--%>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/exif-js"></script>
    <style>
        .dragAndDropDiv {
            border: 2px dashed #92AAB0;
            width: 650px;
            height: 200px;
            color: #92AAB0;
            text-align: center;
            vertical-align: middle;
            padding: 10px 0px 10px 10px;
            font-size:200%;
            display: table-cell;
        }
        .progressBar {
            width: 200px;
            height: 22px;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            display:inline-block;
            margin:0px 10px 5px 5px;
            vertical-align:top;
        }

        .progressBar div {
            height: 100%;
            color: #fff;
            text-align: right;
            line-height: 22px; /* same as #progressBar height if we want text middle aligned */
            width: 0;
            background-color: #0ba1b5; border-radius: 3px;
        }
        .statusbar{
            border-top:1px solid #A9CCD1;
            min-height:25px;
            width:99%;
            padding:10px 10px 0px 10px;
            vertical-align:top;
        }
        .statusbar:nth-child(odd){
            background:#EBEFF0;
        }
        .filename{
            display:inline-block;
            vertical-align:top;
            width:250px;
        }
        .filesize{
            display:inline-block;
            vertical-align:top;
            color:#30693D;
            width:100px;
            margin-left:10px;
            margin-right:5px;
        }
        .abort{
            background-color:#A8352F;
            -moz-border-radius:4px;
            -webkit-border-radius:4px;
            border-radius:4px;display:inline-block;
            color:#fff;
            font-family:arial;font-size:13px;font-weight:normal;
            padding:4px 15px;
            cursor:pointer;
            vertical-align:top
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            var objDragAndDrop = $(".dragAndDropDiv");

            $(document).on("dragenter",".dragAndDropDiv",function(e){
                e.stopPropagation();
                e.preventDefault();
                $(this).css('border', '2px solid #0B85A1');
            });
            $(document).on("dragover",".dragAndDropDiv",function(e){
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on("drop",".dragAndDropDiv",function(e){

                $(this).css('border', '2px dotted #0B85A1');
                e.preventDefault();
                var files = e.originalEvent.dataTransfer.files;

                handleFileUpload(files,objDragAndDrop);
            });

            $(document).on('dragenter', function (e){
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('dragover', function (e){
                e.stopPropagation();
                e.preventDefault();
                objDragAndDrop.css('border', '2px dotted #0B85A1');
            });
            $(document).on('drop', function (e){
                e.stopPropagation();
                e.preventDefault();
            });
            //drag 영역 클릭시 파일 선택창
            objDragAndDrop.on('click',function (e){
                $('input[type=file]').trigger('click');
            });

            $('input[type=file]').on('change', function(e) {
                var files = e.originalEvent.target.files;
                handleFileUpload(files,objDragAndDrop);
            });

            function handleFileUpload(files,obj)
            {
                for (var i = 0; i < files.length; i++)
                {
                    var fd = new FormData();
                    fd.append('file', files[i]);

                    var status = new createStatusbar(obj); //Using this we can set progress.
                    status.setFileNameSize(files[i].name,files[i].size);
                    sendFileToServer(fd,status);

                }
            }

            var rowCount=0;
            function createStatusbar(obj){

                rowCount++;
                var row="odd";
                if(rowCount %2 ==0) row ="even";
                this.statusbar = $("<div class='statusbar "+row+"'></div>");
                this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);

                obj.after(this.statusbar);

                this.setFileNameSize = function(name,size){
                    var sizeStr="";
                    var sizeKB = size/1024;
                    if(parseInt(sizeKB) > 1024){
                        var sizeMB = sizeKB/1024;
                        sizeStr = sizeMB.toFixed(2)+" MB";
                    }else{
                        sizeStr = sizeKB.toFixed(2)+" KB";
                    }

                    this.filename.html(name);
                    this.size.html(sizeStr);
                }

                this.setProgress = function(progress){
                    var progressBarWidth =progress*this.progressBar.width()/ 100;
                    this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                    if(parseInt(progress) >= 100)
                    {
                        this.abort.hide();
                    }
                }

                this.setAbort = function(jqxhr){
                    var sb = this.statusbar;
                    this.abort.click(function()
                    {
                        jqxhr.abort();
                        sb.hide();
                    });
                }
            }

            function sendFileToServer(formData,status)
            {
                var uploadURL = "/fileUpload/post"; //Upload URL
                var extraData ={}; //Extra Data.
                var jqXHR=$.ajax({
                    xhr: function() {
                        var xhrobj = $.ajaxSettings.xhr();
                        if (xhrobj.upload) {
                            xhrobj.upload.addEventListener('progress', function(event) {
                                var percent = 0;
                                var position = event.loaded || event.position;
                                var total = event.total;
                                if (event.lengthComputable) {
                                    percent = Math.ceil(position / total * 100);
                                }
                                //Set progress
                                status.setProgress(percent);
                            }, false);
                        }
                        return xhrobj;
                    },
                    url: uploadURL,
                    type: "POST",
                    contentType:false,
                    processData: false,
                    cache: false,
                    data: formData,
                    success: function(data){
                        status.setProgress(100);

                        //$("#status1").append("File upload Done<br>");
                    }
                });

                status.setAbort(jqXHR);
            }

        });
    </script>
</head>
<body>
<jsp:include page="../../layout/header.jsp" flush="false"></jsp:include>
<div class="container-fluid container">

    <form action="/photo/save?email=${sessionScope.loginEmail}" class="photoSave" id="photoSave" method="post" name="photoSave" enctype="multipart/form-data">

        <div id="dragAndDropDiv" class="mt-5 dragAndDropDiv">Drag & Drop picture Here or Browse picture<br>Only JPG / PNG </div>
        <input type="file" name="photos" id="fileUpload"  accept="image/png,image/jpg,image/jpeg" style="display:none;" multiple/>
        <h6>사진 이름</h6>
        <input type="text" style= width:650px class="form-control" name="photo_title"><br>
        <h6>사진 설명</h6>
        <input type="text" style= width:650px class="form-control" name="photo_contents"><br>

        <select style= width:650px class="col-sm-6 form-select" name="photo_brand" onchange="categoryChange(this)">
            <option>브랜드를 선택해주세요</option>
            <option value="Sony">Sony</option>
            <option value="Iphone">Iphone</option>
            <option value="Leica">Leica</option>
        </select>

        <select style= width:650px class="col-sm-6 form-select" id="good" name="camera_model">
            <option>모델을 선택해주세요</option>
        </select>
        <script>
            function categoryChange(e) {
                var Sony = ["a7m4", "a9", "a1", "a7r5"];
                var Iphone = ["12mini", "13pro", "13ultra", "13mini"];
                var Leica = ["m9", "m10", "m11", "m12", "m-mono"];
                var target = document.getElementById("good");

                if(e.value == "Sony") var d = Sony;
                else if(e.value == "Iphone") var d = Iphone;
                else if(e.value == "Leica") var d = Leica;

                target.options.length = 0;

                for (x in d) {
                    var opt = document.createElement("option");
                    opt.value = d[x];
                    opt.innerHTML = d[x];
                    target.appendChild(opt);
                }
            }
        </script>
        <input type="button" class="btn btn-success" value="업로드하기" onclick="saveFn()">

    </form>
</div>
<%--private String photo_title;
private String photo_contents;




private String camera_brand;
private String camera_lens;




private String shutterSpeed;
private String focal_length;
private String iso;
private String iris;--%>
</body>
</html>
