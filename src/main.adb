
with Componolit.Runtime.Debug;

procedure Main
is
   procedure Delay_Ms(Ms : Natural) with
      Import,
      Convention    => C,
      External_Name => "delayMicroseconds";
   function Message return String;
   function Message return String
   is
   begin
      return "Make with Ada!";
   end Message;
begin
   Componolit.Runtime.Debug.Log_Debug (Message & ASCII.LF & ASCII.CR);
   Delay_Ms (500000);
end Main;
