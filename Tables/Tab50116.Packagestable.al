table 50116 "Packages table"
{
    Caption = 'Packages table';
    DataClassification = ToBeClassified;
    
    
    fields
    {
        field(1; "Code"; Code[90])
        {
            Caption = 'Code';
            
        }
        field(2; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(3; "Amount Payable"; Decimal)
        {
            Caption = 'Amount Payable';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
