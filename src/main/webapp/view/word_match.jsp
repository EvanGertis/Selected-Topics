<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html lang="en">
  <head>
    <title>Word Match Generator</title>
    <style>
    *:focus {outline: 2px solid blue; outline-offset: 2px;}
    details {padding:3px;}
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/boxes.css" />
    <script type="text/javascript" src="event1.js?v=9999"></script>
  
<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-89940905-27"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments)};
  gtag('js', new Date());
  gtag('config', 'UA-89940905-27');
</script>

<!-- <script type="text/javascript" src="../logging.js"></script> -->
</head>


  <body>
    <div id="maincontentstyle">
        <div id="boxstyle">
          <h3 id= "title">Word Match Generator</h3>
          <div class="row">
            <div id="inputs" class="column column-1">
                <div id="inputBoxes" class="inputBoxes">
                    <title>Input:</title>
                    <div class="row">
                      Title: <input id= "title_input" type="text">
                    </div>  
                    <div class="row">
                      Key Term 1: <input id="el1" type="text" value="">
                    </div>
                    <div class="row">
                      Description 1: <input id="dl1" type="text" value="">
                    </div>
                    <div class="row">
                      Key Term 2: <input id="el2" type="text" value="">
                    </div>
                    <div class="row">
                      Description 2: <input id="dl2" type="text" value="">
                    </div>
                </div>
                <span style="padding: 3px">
                  <button id ="one" class="button" type="button" onClick="add_more()">add more</button>
                </span>
                <span style="padding: 3px">
                  <button id ="one" class="button" type="button" onClick="generate_html()">generate html</button>
                </span>
            </div>
            </div>
          </div>
          <div id="results" class="row">
          </div>
          <div id="renderedHTML" class="row">
          </div>
        </div>


    
<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.ui.touch-punch.min.js"></script><script src="${pageContext.request.contextPath}/static/js/jquery.alerts.js"></script><link href="${pageContext.request.contextPath}/static/js/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />  

<script type="text/javascript">
$(init);
$( window ).unload(function() {
  removeStorage.removeItem("someVarKey1");
});
function init() {
      document.getElementById('resetButton').style.display = 'none';
document.getElementById("resetButton").style.visibility = "hidden";
if (false && sessionStorage.getItem("someVarKey1")) // No focus for the first time
  $("#one").focus();
  var numbers = [3, 4, 5, 1, 2];
  initialize(numbers);
  

}
</script>
    <script>
    // initially html is not generated.
    var htmlGenerated = false;
    // number of inputs start out as 2.
    var numberOfInputs = 2;
    // initially no addtional inputs have been added.
    var addMore = false;
    // initially html is not rendered
    var htmlRendered = false;
    // initialize the answer.
    var answer = '';
      
    function reset() {
      // reset the htmGenerated to false.
      htmlGenerated = false;
      htmlRendered  = false;
      numberOfInputs = 2;
      var someVarName = true;
      sessionStorage.setItem("someVarKey1", someVarName);
      window.location.reload();
    }

    function show_answer() {
      // retrieve the keys and descriptions. Then load them into their respective arrays.
      const e_inputs = document.querySelectorAll("[id^='el']");
      const d_inputs = document.querySelectorAll("[id^='dl']");
      let elArray = [];
      let dlArray = [];
      const title = document.getElementById('title_input').value;
      e_inputs.forEach( i => { if(i.value) elArray.push(i.value) });
      d_inputs.forEach( i => { if(i.value) dlArray.push(i.value) });

      //reset the answer once the generate_html() is called.
      answer = '';
      for (let i = 0; i < elArray.length; i++) {
          answer += elArray[i];
          answer += ':';
          answer += dlArray[i];
          answer += '\n';
      }
      jAlert(answer, 'Correct Match');
    }

    function generate_html() {
      // retrieve the keys and descriptions. Then load them into their respective arrays.
      const e_inputs = document.querySelectorAll("[id^='el']");
      const d_inputs = document.querySelectorAll("[id^='dl']");
      let elArray = [];
      let dlArray = [];
      const title = document.getElementById('title_input').value;
      e_inputs.forEach( i => { if(i.value) elArray.push(i.value) });
      d_inputs.forEach( i => { if(i.value) dlArray.push(i.value) });
    
      //has the html already been generated? 
      if(!htmlGenerated){
        //fetch the results box
        results = document.getElementById("results");
        
        //create textarea
        textarea = document.createElement("textarea");
        textarea.setAttribute("id","generated_html_textarea");
        
        // initialize blank html
        let html = '';
        html += '<div id=\"maincontentstyle\">\n'
        html += '\t<center>\n'
        html += '\t\t<div id=\"boxstyle\">\n'
        html += '\t\t\t<h3 id=\"title\">'+title+"</h3>\n";
        //create key inputs
        html += '\t\t\t\t<center>\n'
        html += '\t\t\t\t\t<div class="source">\n' 
        for (let i = numberOfInputs; i < elArray.length+numberOfInputs; i++){
          html += '\t\t\t\t\t\t<div id="s';
          id   = (1+i-numberOfInputs);
          html += id;
          html +='\" class=\"draggyBox-small\">\n';
          console.log(elArray[i-numberOfInputs]);
          html += '\t\t\t\t\t\t\t'
          html += elArray[i-numberOfInputs]
          html += '\n';
          html +='\t\t\t\t\t\t</div>\n';
        }
        html += '\t\t\t\t\t</div>\n'
        html += '\t\t\t\t\t</center>\n'
  
        //create description inputs
        html += '\t\t\t\t\t<table id=\"tablestyle\">\n'
        for (let i = numberOfInputs; i < dlArray.length+numberOfInputs; i++){
          html +='\t\t\t\t\t\t<tr>\n'
          html += '\t\t\t\t\t\t<td id="row';
          id   = (1+i-numberOfInputs);
          html += id;
          html +='">\n';
          html += '\t\t\t\t\t\t\t<div id=\"t';
          html += id;
          html +='" class=\"ltarget\">'
          html +='</div>\n' 
          html +='\t\t\t\t\t\t</td >\n'
          html +='\t\t\t\t\t\t<td id=\"d'
          html += id
          html += '\">\n'
          html += '\t\t\t\t\t\t\t';
          console.log(dlArray[i-numberOfInputs]);
          html += dlArray[i-numberOfInputs];
          html += '\n';
          html +='\t\t\t\t\t\t\t</td >\n' 
          html +='\t\t\t\t\t\t</tr>\n';
        }
        html += '\t\t\t\t\t</table>\n';
        html += '\t\t\t\t</center>\n'
        html += '\t\t</div>\n'
        html += '\t</center>\n'
        html += '</div>'

        // html generation is done.
        htmlGenerated = true;
        textarea.value = html;
        results.replaceChildren(textarea);

        // Generate reset, show answer, , and render html buttons
        controls = document.createElement("div");
        controls.setAttribute("id","program1");
        controls.setAttribute("style","border: 1px solid #EB0D1B; width: 360px; font-family: courier; font-size: 100.5%; margin: 0px auto; border: 1px; text-align: center; margin-top: 5px;");
        controls.innerHTML +=  '<button id = "renderHTMLButton" class="button" type="button" onClick="render_html()">Render html</button>';
        controls.innerHTML +=  '<button id = "submit" class="button" type="button" onClick="saveContent()">post</button>';
        results.appendChild(controls);
      }
    }

    
    function saveContent(){
        var html_content = document.getElementById("generated_html_textarea");
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/wordmatch", true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.onreadystatechange = function()
        {
            if(xhr.readyState == 4 && xhr.status == 201) {
                console.log("content saved");
            }
            else{
                console.log("content was not save successfully");
            }
        }
        console.log('{"content":\"'
                +html_content.value+'\"}');
        xhr.send('{"content":\"'
                +html_content.value+'\"}');
    }

    function add_more() {
      // we've added more inputs.
      addMore = true;

      // set html generated to false, because new inputs have been added.
      htmlGenerated = false;
      
      // increment the number of inputs.
      numberOfInputs++;

      //fetch the input boxes.
      inputs = document.getElementById("inputBoxes");
      
      //create a new row for a key term.
      row = document.createElement("div");
      row.setAttribute("class","row");

      // set the key term text.
      row.innerHTML = "Key Term ";
      row.innerHTML +=numberOfInputs;
      row.innerHTML +=" :";

      // create the input for the key.
      key = document.createElement("input");
      key.setAttribute("id","el"+numberOfInputs);

      //add the key to the row.
      row.appendChild(key);

      //create a row for the new description.
      row2 = document.createElement("div");
      row2.setAttribute("class","row");

      // set the description text.
      row2.innerHTML = "Description  "
      row2.innerHTML+=numberOfInputs;
      row2.innerHTML+=" :";

      // create the description input
      description = document.createElement("input");
      description.setAttribute("id","dl"+numberOfInputs);

      // add the description to the row.
      row2.appendChild(description);

      // add the rows for the key and the description to the inputBoxes.
      inputs.appendChild(row);
      inputs.appendChild(row2);
    }

    function render_html(){
      textarea  = document.getElementById("generated_html_textarea");
      // Set the generate html to the value from the textarea.
      generated_html = textarea.value;
      console.log(generated_html);
      // Create a new tab.
      var new_window = window.open('');
      maincontentstyle = document.getElementById("maincontentstyle");
      rendered_html = document.createElement("div");
      rendered_html.setAttribute("id","rendered_html");
      rendered_html.setAttribute("style","border: 1px solid #EB0D1B; width: 360px; font-family: courier; font-size: 100.5%; margin: 0px auto; border: 1px; text-align: center; margin-top: 5px;");
      rendered_html.innerHTML +=  generated_html;
      rendered_html.innerHTML +='<span style="padding: 3px"> <button id ="one" class="button" type="button" onClick="show_answer()">Show Answer</button> <button id = "resetButton" class="button" type="button" onClick="reset()">Reset</button> </span>';
      results = document.getElementById("results");
      // Append the rendered html to the results tab
      results.appendChild(rendered_html);
      htmlRendered = true;
      header = '<!DOCTYPE HTML>\n<html lang=\"en\">\n\t<head>\n\t\t<title>Word Matching Exercise</title>\n\t\t<style>\n*:focus {outline: 2px solid blue; outline-offset: 2px;}\n\t\tdetails {padding:3px;}\n\t\t</style>\n\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/static/css/boxes.css\" />\n\t\t<script type=\"text/javascript\" src=\"event1.js?v=9999\">';
      header += '</'
      header += 'script>\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-89940905-27\">'
      header += '</'
      header += 'script>\n<script>\n\t window.dataLayer = window.dataLayer || [];\n\t function gtag(){dataLayer.push(arguments)};\tgtag(\"js\", new Date());\tgtag(\"config\", \"UA-89940905-27\");\n'
      header += '</'
      header += 'script>\n'
      header += '<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.min.js">'
      header += '</'
      header += 'script>'
      header += '<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js">'
      header += '</'
      header += 'script>'
      header += '<script src="${pageContext.request.contextPath}/static/js/jquery.ui.touch-punch.min.js">'
      header += '</'
      header += 'script>'
      header += '<script src="${pageContext.request.contextPath}/static/js/jquery.alerts.js">'
      header += '</'
      header += 'script>'
      header += '<link href="${pageContext.request.contextPath}/static/js/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen">'
      header += '<script type=\"text/javascript\" src=\"${pageContext.request.contextPath}/static/js/logging.js\">'
      header += '</'
      header += 'script>\n</head>\n\t\t<body>';
      new_tab_html = header;
      new_tab_html += rendered_html.innerHTML;
      footer = '\n\t\t</body>\n</html>\n';
      footer += '<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/GetElementPosition.3.js">'
      footer += '</'
      footer += 'script>'
      footer += '<script>audioOn = false; $(function() {$(\'.menulink\').click(function(){if (audioOn) {$("#bg").attr(\'src\',\"${pageContext.request.contextPath}/static/images/audioOff.png\");  audioOn = false;}else {$(\"#bg\").attr(\'src\',"${pageContext.request.contextPath}/static/images/audioOn.png");audioOn = true; speak(" ");}return false;});});'
      footer += '</'
      footer += 'script>'
      footer += '<img id="bg" src="${pageContext.request.contextPath}/static/images/audioOff.png" height="30" width="30" style="margin-bottom:-10px; padding-bottom:-20px;">'
      new_tab_html += footer;
      console.log(new_tab_html);
      new_window.document.write(new_tab_html);
    }
    
</script>
   
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/GetElementPosition.3.js"></script>
   <script> 
  

audioOn = false;
$(function() {
  $('.menulink').click(function(){
    if (audioOn) {
      $("#bg").attr('src',"${pageContext.request.contextPath}/static/images/audioOff.png");  
      audioOn = false;
    }
    else {
      $("#bg").attr('src',"${pageContext.request.contextPath}/static/images/audioOn.png");
      audioOn = true; speak(" ");
    }
    return false;
  });
});
   </script>   

   </body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/highlight.min.js"></script>