

// Enable debug (NSLog)
//#define DEBUG 1


#ifdef DEBUG
    #define NSLog(fmt, ...) NSLog((@"\n%s : [Line - %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define NSLog(fmt, ...)
#endif