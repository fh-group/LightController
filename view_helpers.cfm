<cfscript>
  private string function render(required string view_path, struct locals={}){
    var loc = {};
    var locals = arguments.locals;
    loc.html = '';
    loc.view_file_path = "/views/#arguments.view_path#.cfm";

    if(fileExists(loc.view_file_path)){
      savecontent variable="loc.html" { include loc.view_file_path; }
    }else{
      throw(type="ViewNotFound", message="View was unable to be found.");
    }
    
    return loc.html;
  }

  private string function renderJSON(required any obj){
    var loc = {};
    loc.json = '{}';

    try{
      loc.json = serializeJSON(arguments.obj)
    }catch(Exception e){
      
    }
    
    return loc.json;
  }
</cfscript>
