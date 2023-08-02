table 50108 BookingTable
{
    Caption = 'BookingTable';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(2; Phone; Text[12])
        {
            Caption = 'Phone';
        }
        field(3; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(4; Address; Code[15])
        {
            Caption = 'Address';
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
}
