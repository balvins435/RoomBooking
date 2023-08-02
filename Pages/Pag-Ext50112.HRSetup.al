pageextension 50112 "HR Setup" extends "Human Resources Setup"
{
    layout
    {
        addafter("Employee Nos.")
        {
            field("Booking No."; Rec."Booking No.")
            {

            }
            field("Booking Line"; Rec."Booking Line")
            {

            }
            field("Item No"; Rec. "Item No")
            {
                
            }
        }

    }

}
