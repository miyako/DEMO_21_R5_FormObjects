// Second window: a nested dialog, the start screen resumes when it closes
var $window : Integer:=Open form window("OutputForm"; Plain form window; Horizontally centered; Vertically centered; *)
DIALOG("OutputForm")
CLOSE WINDOW($window)
