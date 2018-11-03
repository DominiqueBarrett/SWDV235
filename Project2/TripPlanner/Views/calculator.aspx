<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calculator.aspx.cs" Inherits="calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Trip Planner Calc</title>
    <link href="../_css/site.css" rel="stylesheet" />
    <script src="../_js/site.js"></script>
    <script type="text/javascript">
        function processEntries() {
          var miles = parseFloat($("miles").value);
          var gallons = parseFloat($("milesPerGallons").value);


          if (isNaN(miles)) {
            alert("Miles must be numeric");
            $("miles").focus();
          } else if (miles <= 0) {
            alert("Miles must be greater than zero");
            $("miles").focus();
          } else if (isNaN(gallons)) {
            alert("Gallons must be numeric");
            $("milesPerGallons").focus();
          } else if (gallons <= 0) {
            alert("gallons must be greater than zero");
            $("milesPerGallons").focus();
          } else {
            $("mpg").value = calculateMpg(miles, gallons);
          }
        }
        function calculateMpg(miles, gallons) {
            var mpg = (miles / gallons);
            mpg = mpg.toFixed(1);
            return mpg;
          }
          function clearEntries() {
          $("miles").value = null;
          $("milesPerGallons").value = null;
          $("mpg").value = null;
        }
    </script>
</head>
  <body class="calculator">
    <div class="wrapper">
      <header>
        <div class="logos" style="width:100%">
          <img style="" src="../_images/LogoAddition2.png" alt="Company Logo" />
          <img style="" src="../_images/CompanyLogo2.png" alt="Company Logo" />
          <img style="" src="../_images/LogoAddition2.png" alt="Company Logo" />
        </div>
        <div class="navigation">
          <nav>
            <ul class="mainNav">
              <li><a href="Default.aspx" class="homeLink">Home</a></li>
              <li><a href="FAQ.aspx" class="FAQLink">FAQ</a></li>
              <li><a href="calculator.aspx" class="calculatorLink">Gas Calculator</a></li>
              <li><a href="contact.aspx" class="contactLink">Contact Us</a></li>
              <li><a href="newsLetter.aspx" class="newsLetterLink">News Letter</a></li>
            </ul>
          </nav>
        </div>
      </header>
      <div class="content">
        <div class="main">
          <h1>How many gallons of gas will you use?</h1>
          <h2>Fill in this form to find out</h2>
          <form>
            <table style="margin-left:auto; margin-right: auto;">
              <tr>
                <td><label for="miles">Trip Miles:&nbsp;</label></td>
                <td><input type="text" id="miles" /><br/></td>
              </tr>
              <tr>
                <td><label for="milesPerGallons">Your MPG:</label></td>
                <td><input type="text" id="milesPerGallons" /><br/></td>
              </tr>
              <tr>
                <td><label for="mpg">Estimated Gallons That Will Be Used</label><br/><br/></td>
                <td><input type="text" id="mpg" disabled="disabled" /><br/><br/></td>
              </tr>
              <tr>
                <td><input type="button" id="calculate" onclick="processEntries()" value="Calculate Gallons of Gas" /><br/></td>
                <td><input type="button" id="clear" onclick="clearEntries()" value="Clear Entries" /><br/></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <footer>
        <p>Any Information is subject to personal opinions by Dominique Barrett.<img class="animated" style="width:100px;" src="../_images/Airplane.png" alt="Airplane" />
          The date is already <strong>
          <script>printToday();</script>
        </strong> you better start planning now! And make sure to travel responsibly.</p>
      </footer>
    </div>
  </body>
</html>
