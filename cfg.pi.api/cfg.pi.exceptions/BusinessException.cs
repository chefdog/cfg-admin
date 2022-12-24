namespace cfg.pi.exceptions
{
    [Serializable]
    public class BusinessException : ApplicationException
    {
        public BusinessException() { }

        public BusinessException(string message) : base(message) { }

        public BusinessException(string message, Exception innerException) : base(message, innerException) { }
    }
}