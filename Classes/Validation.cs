using System;
using System.Text.RegularExpressions;

namespace URPSSPSuccessTracker.Classes
{
    public class Validation
    {
        //Validates for a valid phone number 
        public bool ValidatePhoneNumber(string PhoneNumber)
        {
            Regex regexPhoneNumber = new Regex(@"^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$");
            return (regexPhoneNumber.IsMatch(PhoneNumber));
        }

        //Check for a box to have a value
        public bool IsBlank(string FormString)
        {
            return (string.IsNullOrEmpty(FormString) || string.IsNullOrWhiteSpace(FormString));
        }

        //Validate a 5 digit zipcode
        public bool ValidateZipCode(string ZipCode)
        {
            Regex regexZipCode = new Regex(@"^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$");
            return (regexZipCode.IsMatch(ZipCode));
        }

        //Validate for a non-negative number
        public bool ValidateNonNegativeNumber(string nonNegativeNumber)
        {
            Regex NonNegativeNumber = new Regex(@"^\d+$");
            return (NonNegativeNumber.IsMatch(nonNegativeNumber));
        }

        //validate for currency
        public bool ValidateCurrency(string validCurrency)
        {
            Regex ValidCurrency = new Regex(@"^\d*\.?\d*$");
            return (ValidCurrency.IsMatch(validCurrency));
        }

        //Validate date
        public bool ValidateDate(string date)
        {
            DateTime res;
            return (DateTime.TryParse(date, out res));
        }

        //Validate for a temple email address.  This also checks for the Temple Hospital emails
        public bool ValidateTempleEmail(string Email)
        {
            Regex regexTempleEmail = new Regex(@"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");
            return ((regexTempleEmail.IsMatch(Email)) && (Email.EndsWith("@temple.edu") || Email.EndsWith("@tuhs.temple.edu")));
        }

        // Validate that it is a potentially vialid email address
        public bool ValidateAnyEmail(string Email)
        {
            Regex regexEmail = new Regex(@"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");
            return (regexEmail.IsMatch(Email));
        }

        //Validate a 9 didgit TUid
        public bool ValidateTUID(string TUID)
        {
            Regex regexTUID = new Regex(@"^\d{9}$");
            return (regexTUID.IsMatch(TUID));
        }

        //Validate for a 4 digit acedemic year
        public bool ValidateAcademicYear(string academicYear)
        {
            Regex regex = new Regex(@"^\d{4}[-]\d{4}$");
            return (regex.IsMatch(academicYear));
        }

        //Validate length of string in a text box
        public bool ValidateLength(string tbox, int length)
        {
            return tbox.Length == length;
        }

        //Validate word count in a text field
        public bool ValidateWordCount(string tbox, int count)
        {
            return tbox.Length <= (count * 10);
        }

        public bool ValidateNumberValue(string num, double maxNum)
        {
            if (!string.IsNullOrEmpty(num))
            {
                return long.Parse(num) <= maxNum;
            }
            else
            {
                return false;
            }
        }
    }
}