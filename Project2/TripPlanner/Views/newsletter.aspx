<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsLetter.aspx.cs" Inherits="Views_newsletter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Trip Planner News</title>
    <link href="../_css/site.css" rel="stylesheet" />
    <script src="../_js/site.js"></script>
    <style>
        .errorMesssage{
            color: yellowgreen; 
            width: 300px;
        }
        </style>
</head>
  <body class="newsLetter">
      <div class="wrapper">
      <header>
        <div class="logos" style="Width: 100%">
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
                  <h1>Sign up for our <em>FREE</em> newsletter!</h1>
                  <h2>Each week you'll learn valuable tips for Travel and Exploration.<br/>Just sign up below.</h2>
                  <%--this is the newsletter form, each input has an onchange event that is called every time something is changed to validate it as the user goes.
                     AutoPostBack is set to true so they are called everytime--%>
                    <form id="test" runat="server">
                        <table style="margin-left:auto; margin-right: auto;">
                              <tr>
                                <td style="width: 300px; text-align: right;"><label>First Name:&nbsp;</label></td>
                                <td>
                                    <asp:TextBox ID="txtFirstName" runat="server" AutoPostBack="True" class="textbox" OnTextChanged="txtFirstName_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblFirstNameError" runat="server" Text="" class="errorMesssage"></asp:Label>

                                </td>
                              </tr>
                              <tr>
                                <td style="text-align: right;"><label>Last Name:&nbsp;&nbsp;</label></td>
                                <td>
                                    <asp:TextBox ID="txtLastName" runat="server" AutoPostBack="True" Class="textbox" OnTextChanged="txtLastName_TextChanged"></asp:TextBox>
                                    <br/>
                                </td>
                                <td>
                                    <asp:Label ID="lblLastNameError" runat="server" Text="" class="errorMesssage"></asp:Label>
                                </td>
                              </tr>
                              <tr>
                                <td style="text-align: right;"><label>Email Address: </label><br/></td>
                                <td>
                                    <asp:TextBox ID="txtEmailAddress" runat="server" AutoPostBack="True" Class="textbox" OnTextChanged="txtEmailAddress_TextChanged"></asp:TextBox>
                                    <br/></td>
                                <td><div class="errorMesssage" id="emailAddressError">
                                    <asp:Label ID="lblEmailAddressError" runat="server" Text="" class="errorMesssage"></asp:Label>
                                    </div></td>
                              </tr>
                              <tr>
                                <td></td>
                                <td>
                                    <%--The Submit has an OnClick event that will trigger all the validations calls--%>
                                    <asp:Button ID="newsLetterSubmit" runat="server" Text="Submit" OnClick="newsLetterSubmit_Click" />
                                    <br/>
                                </td>
                              </tr>
                        </table>
                    </form>
                    <asp:Label ID="lblCompleteMessage" runat="server" Text=""></asp:Label>
                    

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
