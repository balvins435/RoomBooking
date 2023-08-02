tableextension 50120 CustomerExt extends Customer
{
    fields
    {
        field(50100; "KRA No"; Code[100])
        {
            Caption = 'KRA No';
            DataClassification = ToBeClassified;
        }
        field(50101; "Amount Payable"; Decimal)
        {
            Caption = 'Amount Payable';
            DataClassification = ToBeClassified;
        }
    }
}
