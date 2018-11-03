<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Trip Planner FAQ</title>
    <script src="../_js/site.js"></script>
    <link href="../_css/site.css" rel="stylesheet" />
    <script src="../_js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            FAQShowHide();
        }); // end ready
    </script>
</head>
  <body class="FAQ">
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

          <h1>Trip Planning FAQ</h1>
          <div class="faq">
      <h2>What are some Great Caves to explore?</h2>
          <div class="answer">
              <p>Carslbad Cavern is one of the amazing cave systems out there and is a suggested site for anyone looking for that cave experience.</p>
            </div>
      </div>
      <div class="faq">
            <h2>Can I bring my cat with me on vacation?</h2>
            <div class="answer">
              <p>It is not a suggested thing to do, and most cats don't like to travel. But if you are determined to bring him/her along then let us know and we can make the arrangements for you!</p>
            </div>
      </div>
      <div class="faq">
            <h2>What is one thing I should bring with me in my car while driving cross-country?</h2>
            <div class="answer">
              <p>Water, always have a case of water in your car. You never know when you will be stranded  in the desert with a 10 mile or more walk back to somewhere that has people...</p>
            </div>
      </div>
      <div class="faq">
            <h2>What kind of accesibility does Carlsbad Cavern have?</h2>
            <div class="answer">
              <p>This might actually supprise you, but there is actually an elevator for anyone Handicapped, so if you are in a wheel chair you can still see the wonders of the Caverns!!</p>
            </div>
      </div>
      <div class="faq">
            <h2>When cave spelunking should I bring a lantern of some sort or a flashlight?</h2>
            <div class="answer">
              <p>Something that can either be attached to your write or be put in your pocket is usually best, soem of the small flashlights can actually be pretty powerful.</p>
            </div>
      </div>

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
