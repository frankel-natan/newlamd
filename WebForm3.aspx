<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="LamedNetLite.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
<body>

<!-- Button trigger modal -->
<button id="btn1" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    Launch demo modal
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
<script>
    document.getElementById("btn1").click();
</script>
</body>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <script src="JQ/jquery.min.js"></script>
    <script>
       // document.getElementById("btn1").click();
       // $('#myModal').on('shown.bs.modal', function () {
       //     $('#myInput').trigger('focus')
       // })
       // //$('#myModal').modal(options);
       //// $('#myModal').modal('show');
       // $('#myModal').modal({
       //     keyboard: false
       // })
        //let modal = document.querySelector(".modal-dialog");
       // modal.style.display = "block";
        
        //modalBtn.onclick = function () {
        //    modal.style.display = "block"
        //}
    </script>
</html>
