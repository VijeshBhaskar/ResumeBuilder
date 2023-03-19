namespace Website.Common.Response
{
    public struct ResponseCode
    {
        public static string Success = "Success";
        public static string Error = "Error";
        public static string ModelIsNotValid = "ModelIsNotValid";
        public static string AlreadyExists = "AlreadyExists";
        public static string Failed = "Failed";
        public static string InvalidRequest = "InvalidRequest";
    }

    public class Response<T>
    {
        public string Status { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
    }
}