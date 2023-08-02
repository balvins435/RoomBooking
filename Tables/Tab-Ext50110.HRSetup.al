tableextension 50110 "HR Setup" extends "Human Resources Setup"
{
    fields
    {
        field(50100; "Booking No."; Code[90])
        {
            Caption = 'Booking No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50101; "Booking Line"; Code[90])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50102; "Item No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Room Booking Lines";
        }
    }
}
