page 50116 PackagesList
{
    Caption = 'PackagesList';
    PageType = List;
    SourceTable = "Packages table";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    
                }

                field("Amount Payable"; Rec."Amount Payable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Payable field.';                                                                                                                                                                                                                                                                                                              
                }

            }
        }
    }
}
