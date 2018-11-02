<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8" />
  <title>Trip Planner Home</title>
  <link href="../_css/site.css" rel="stylesheet" />
  <script src="../_js/site.js"></script>
  <script type="text/javascript">

  //this is for the slideshow on the Default page
  	window.onload = function() {
        indexSlideShow();
  	};
    </script>
</head>
<body class="home">
  <div class="wrapper">
    <header>
      <div class="logos" style="width: 100%">
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
        <h1>Going where the wind blows</h1>
        <p class="bubble"> No matter who you are or where you go, there is always something new and exciting just waiting to be explored!</p>
        <main class="slideShow">
          <ul id="image_list">
              <li><a href="../_images/carlsbadCavern.jpg" title="Carlsbad Cavern has so many natural beauties"></a></li>
              <li><a href="../_images/stalagmitesAndStalagtites.jpg" title="Like these! Remember Stalagmites go up and Stalagtites go down"></a></li>
              <li><a href="../_images/windingRoad.jpg" title="Go in here! It will be fun they say..."></a></li>
              <li><a href="../_images/bats.jpg" title="Oh God Run for your lives!!!"></a></li>
              <li><a href="../_images/bats2.jpg" title="There are so many bats!! They keep pouring out of that cave!"></a></li>
          </ul>
          <p><img src="../_images/carlsbadCavern.jpg" alt="Carlsbad Cavern" id="image" /></p>
          <h2 id="caption">Carlsbad Cavern has so many natural beauties</h2>
          <p class="slideShowButtons">
              <input type="button" id="start" value="Play" />
              <input type="button" id="pause" value="Pause" disabled="disabled" />
          </p>
      </main>


      </div>
    </div>
    <footer>
      <p>Any Information is subject to personal opinions by Dominique Barrett.<img class="animated" style="width:100px;" src="../_images/Airplane.png" alt="Airplane" /> The date is already <strong>
                <script>printToday();</script>
        </strong> you better start planning now! And make sure to travel responsibly.</p>
    </footer>
  </div>
</body>
</html>
