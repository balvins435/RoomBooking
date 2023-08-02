enum 50121 "Gen. Journal Document Type Cus"
{
    Extensible = true;
    // ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Payment)
    {
        Caption = 'Payment';
    }
    value(2; Invoice)
    {
        Caption = 'Invoice';
    }
    value(3; "Credit Memo")
    {
        Caption = 'Credit Memo';
    }
    value(4; "Finance Charge Memo")
    {
        Caption = 'Finance Charge Memo';
    }
    value(5; Reminder)
    {
        Caption = 'Reminder';
    }
    value(6; Refund)
    {
        Caption = 'Refund';
    }
}