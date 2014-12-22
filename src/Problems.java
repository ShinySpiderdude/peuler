import java.math.BigInteger;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.LongStream;

/**
 * Created by ilan on 21/12/14.
 */
public class Problems {

    public static long problem1(long max) {
        int[] multiplesOf = new int[] {3, 5};
        return LongStream.range(1, max).filter(i -> i % 3 == 0 || i % 5 == 0).sum() ;
    }

    public static BigInteger problem2(long max) {
        long beforeLast = 1 ;
        long last = 2 ;
        BigInteger sum = BigInteger.valueOf(2) ;
        long current = 0;
        while (current <=4000000) {
            current = beforeLast + last ;
            if (current % 2 == 0) sum = sum.add(BigInteger.valueOf(current));

            beforeLast = last ;
            last = current ;
        }
        return sum ;
    }

    private static boolean isPrime(long number) {
        for (int i = 2; i < Math.round(Math.sqrt(number)); i++) {
            if (number % i == 0) {
                return false ;
            }
        }
        return true ;
    }

    public static long problem3(long number) {
        long currentNumber = number;
        for (long i = 2; i < number; i++) {
            if (i > currentNumber) break ;
            if (currentNumber % i == 0 && isPrime(i)) {
                if (currentNumber / i == 1) return currentNumber ;
                currentNumber /= i ;
            }
        }
        //0 means something went wrong
        return currentNumber ;
    }

    private static boolean isPalindrome(long number) {
        String palinString = String.valueOf(number) ;
        for (int i = 0; i < palinString.length() / 2; i++) {
            if (palinString.charAt(i) != palinString.charAt(palinString.length() - i - 1)) {
                return false ;
            }
        }
        return true ;
    }

    public static long problem4() {
        List<Long> theLongList = new LinkedList<>() ;
        for (int i = 999; i > 99; i--) {
            for (int j = 999; j > 99; j--) {
                if (isPalindrome(i*j)) {
                    theLongList.add(Long.valueOf(i*j)) ;
                }
            }
        }
        Collections.sort(theLongList);
        return theLongList.get(theLongList.size() -1);
    }



    public static long problem5(int largestDivisor) {
        return 0 ;

    }


    public static void main(String[] args) {

        //System.out.println(problem3(600851475143L));
        //System.out.println(problem4());
        System.out.println(problem5(20));
    }


}
