
 
  <jsp:include page="admin-header.jsp"/>


    <div class="container-fluid display-table">
      <div class="row display-table-row">
        
        <jsp:include page="admin-sidemenu.jsp"/>


        <!-- Content Area -->
        <div class="col-md-10 col-sm-11 display-table-cell" id="content-area">
          <ol class="breadcrumb">
            <li><a href="admin-dashboard.jsp"><span class="glyphicon glyphicon-home"> Home</span></a></li>
            <li class="active"><a><span class="glyphicon glyphicon-envelope black"> New-Notice</span></a></li>
          </ol>    
            <div id="content">
              <header>
                <h2 class="page-title">Create new notice</h2>
              </header>
              <div class="content-inner">
                <div class="form-wrapper">
                  <form>
                    <div class="form-group">
                      <label class="sr-only">Title</label>
                      <input type="text" class="form-control" id="title" placeholder="Title">
                    </div>
                    <div class="form-group">
                      <label class="sr-only">Tags</label>
                      <select data-placeholder="Select Tags" multiple name="tags" class="form-control chosen-select" >
                        <option></option>
                        <option>Teachers</option>
                        <option>Students</option>
                        <option>Other staff</option>
                      </select>
                      
                    </div>
                    <div class="form-group">
                      <label class="sr-only ">Article</label>
                      <textarea class="form-control summernote" placeholder="Article"  name="article">
                      
                      </textarea>
                    </div>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name=""> Publich article when i click save.
                      </label>
                    </div>
                    <div class="clearfix">
                      <button type="submit"  class="btn btn-success pull-right" >save / publish </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
        </div>
        
        <!-- --------------------------------------------------------------- -->
      </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../Resources/js/bootstrap.min.js"></script>
    <script src="../Resources/js/default.js"></script>
    <script src="../Resources/plugins/chosen/chosen.jquery.min.js"></script>
    <script src="../Resources/plugins/summernote/dist/summernote.min.js"></script>
    <script type="text/javascript">
    var config={
    '.chosen-select' :{},
    '.chosen-select-deselect':{allow_single_deselect :true},
    '.chosen-select-no-single':{disable_search_threshold:10},
    '.chosen-select-no-result':{no_result_text:'Opps,nothing found!'},
    '.chosen-select-width':{width:"95%"}
    }
    for(var selector in config){
    $(selector).chosen(config[selector]);
    }
    </script>
    <script type="text/javascript">
    $('.summernote').summernote({
    height:200
    });
    </script>
  </body>
</html>