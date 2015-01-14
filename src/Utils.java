import java.util.HashMap;
import java.util.Map;

/**
 * Created by ilan on 30/12/14.
 */
public class Utils {

    public static boolean isPrime(long number) {
        for (int i = 2; i < Math.round(Math.sqrt(number)) + 1; i++) {
            if (number % i == 0) {
                return false ;
            }
        }
        return true ;
    }

    public static long getNumberOfDivisors(long number) {
        return getPrimeDivisorsForNumber(number).values().stream().reduce(1L, (total, current) -> total*= (current+1));
    }


    public static Map<Long, Long> getPrimeDivisorsForNumber(long number) {
        Map<Long, Long> divisors = new HashMap<>() ;
        long currentNumber = number;
        for (long i = 2; i < number+1; i++) {
            if (i > currentNumber) break ;
            if (isPrime(i)) {
                while (currentNumber % i == 0) {
                    divisors.putIfAbsent(i, 0L) ;
                    divisors.compute(i, (k, v) -> v + 1) ;
                    currentNumber = currentNumber / i ;
                }
            }
        }
        return divisors ;
    }

}
