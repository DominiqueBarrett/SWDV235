﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class Views_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //This is what the Submit button calls when it is clicked
    protected void newsLetterSubmit_Click(object sender, EventArgs e)
    {
        //Call Validation
        //Each on of these validates a certain input before trying to store the data
        //If any one of them comes back as false or Invalid it will kick it back to the screen with the inputed data still there.
        var isFNValid = FirstNameValidation();
        var isLNValid = LastNameValidation();
        var isEMValid = EmailAddressValidation();
        if (!isFNValid || !isLNValid || !isEMValid)
        {
            return;
        }
        //Call database
        //otherwise it will proceed to the store then clear all entries
        else
        {
            StoreNewsLetter();
            ClearEntries();
        }
    }
    //The ClearEntires just clears out any inputed data so it is a clean slate
    private void ClearEntries()
    {
        txtFirstName.Text = null;
        txtLastName.Text = null;
        txtEmailAddress.Text = null;
    }
    //this validates the firstName
    private Boolean FirstNameValidation()
    {
        //checks to make sure it has more than 2 characters
        if (txtFirstName.Text.Length < 2)
        {
            //if it does not contain more than 2 characters it will give you an error message and return a false to the validation call above.
            lblFirstNameError.Text = "First Name must be at least 2 characters long.";
            txtFirstName.Focus();
            return false;
        }
        //This blanks out the error message so you don't see it if the validation is good
        else
        {
            lblFirstNameError.Text = "";
        }
        return true;
    }
    //everytime someone changes the textbox and then clicks somewhere else it will call this.
    protected void txtFirstName_TextChanged(object sender, EventArgs e)
    {
        //this validates the first name and adds/empties the error message if needed
        FirstNameValidation();
    }
    //This validates the last name
    private Boolean LastNameValidation()
    {
        //checks to make sure it has more than 2 characters
        if (txtLastName.Text.Length < 2)
        {
            //if it does not contain more than 2 characters it will give you an error message and return a false to the validation call above.
            lblLastNameError.Text = "Last Name must be at least 2 characters long.";
            txtLastName.Focus();
            return false;
        }
        else
        {
            //This blanks out the error message so you don't see it if the validation is good
            lblLastNameError.Text = "";
        }
        return true;
    }
    //everytime someone changes the textbox and then clicks somewhere else it will call this.
    protected void txtLastName_TextChanged(object sender, EventArgs e)
    {
        //this validates the Last name and adds/empties the error message if needed
        LastNameValidation();
    }
    //This validates the Email Address
    private Boolean EmailAddressValidation()
    {
        //Regular expression allows for a more detailed Validation.
        //This makes sure you have a string of characters "@" string of characters "." string of characters
        Regex rx = new Regex(@"^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\.[a-zA-Z](-?[a-zA-Z0-9])*)+$");
        //if the email is null it will give a specific error message and return a false to the validation call above
        if (txtEmailAddress.Text == null)
        {
            lblEmailAddressError.Text = "Email Address must be filled out.";
            txtLastName.Focus();
            return false;
        }
        //if the email does not match up with the Reguar expression above it will give a specific error message and return a false to the validation call above
        else if (!rx.IsMatch(txtEmailAddress.Text))
        {
            lblEmailAddressError.Text = "Must be a valid email.";
            txtEmailAddress.Focus();
            return false;
        }
        else
        {
            //This blanks out the error message so you don't see it if the validation is good
            lblEmailAddressError.Text = "";
        }
        return true;
    }
    //everytime someone changes the textbox and then clicks somewhere else it will call this.
    protected void txtEmailAddress_TextChanged(object sender, EventArgs e)
    {
        EmailAddressValidation();
    }
    //This is the Storeage of the data
    private void StoreNewsLetter()
    {
        if (Page.IsValid)
        {
            // Declare objects
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            // Initialize connection
            conn = new SqlConnection(
                    @"Server=F18SERVERB15\SQLDEV01;Database=TripPlanner;User Id=Tester; Password=SuperSecretPa$$w0rd;");
            // Create command
            comm = new SqlCommand(
               "EXECUTE sp_StoreNewsletter @FirstName,@LastName,@EmailAddress", conn);

            // Add parameter
            comm.Parameters.Add("@FirstName", System.Data.SqlDbType.Text);
            comm.Parameters["@FirstName"].Value = txtFirstName.Text;

            comm.Parameters.Add("@LastName", System.Data.SqlDbType.Text);
            comm.Parameters["@LastName"].Value = txtLastName.Text;

            comm.Parameters.Add("@EmailAddress", System.Data.SqlDbType.Text);
            comm.Parameters["@EmailAddress"].Value = txtEmailAddress.Text;
            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                reader = comm.ExecuteReader();

                // Close the reader and the connection
                reader.Close();

                // Display completed message
                lblCompleteMessage.Text = "We will send a confirmation email to: " + txtEmailAddress.Text + " shortly.";
            }
            catch (SqlException ex)
            {
                string str;
                str = "Source:" + ex.Source;
                str += "\n" + "Number:" + ex.Number.ToString();
                str += "\n" + "Message:" + ex.Message;
                str += "\n" + "Class:" + ex.Class.ToString();
                str += "\n" + "Procedure:" + ex.Procedure.ToString();
                str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                str += "\n" + "Server:" + ex.Server.ToString();
                // Display error message
                lblCompleteMessage.Text = "We are unable to connect to the server try again in a little while!";
            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }

    }




}