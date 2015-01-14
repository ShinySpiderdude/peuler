import java.math.BigInteger;
import java.util.*;
import java.util.stream.IntStream;
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

    public static long problem3(long number) {
        long currentNumber = number;
        for (long i = 2; i < number; i++) {
            if (i > currentNumber) break ;
            if (currentNumber % i == 0 && Utils.isPrime(i)) {
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
        //To solve this problem i need to run on all numbers up to the largest divisors, find their prime divisors and then pick the numbers that contain the largest primes
        Map<Integer, Map<Long, Long>> divisorMap = new HashMap<>() ;
        IntStream.range(2, largestDivisor+1).forEach(i -> divisorMap.put(i, Utils.getPrimeDivisorsForNumber(i)));

        //The key is the prime, the value is the largest power of this prime found so far
        Map<Long, Long> mapOfLargestPrimes = new HashMap<>() ;

        Collection<Map<Long, Long>> maps = divisorMap.values() ;

        for (Map<Long, Long> map : maps) {
            for (Map.Entry<Long, Long> entry : map.entrySet()) {
                mapOfLargestPrimes.putIfAbsent(entry.getKey(), entry.getValue()) ;
                mapOfLargestPrimes.computeIfPresent(entry.getKey(), (k, currentValue) -> {
                    if (entry.getValue() > currentValue) {
                        return entry.getValue() ;
                    }
                    return currentValue ;
                }) ;
            }
        }

        long lowestCommonMultiplier = 1 ;

        for (Map.Entry<Long, Long> entry : mapOfLargestPrimes.entrySet()) {
            lowestCommonMultiplier *= Math.pow(entry.getKey(), entry.getValue()) ;
        }

        return lowestCommonMultiplier ;

    }

    public static long problem6(int firstNaturalNumbers) {
        long squareOfSums = 0 ;
        long sumOfSquares = 0 ;
        for (int i = 1; i <= firstNaturalNumbers; i++) {
            squareOfSums += i ;

            sumOfSquares += (long)Math.pow(i, 2) ;
        }
        squareOfSums = (long)Math.pow(squareOfSums, 2) ;
        return squareOfSums - sumOfSquares;
    }

    public static long problem7(int thPrimeNumber) {
        int primesFound = 0 ;
        long currentNumber = 1 ;
        while (primesFound < thPrimeNumber) {
            currentNumber++ ;
            if (Utils.isPrime(currentNumber)) {
                primesFound++ ;
            }
        }
        return currentNumber ;
    }

    public static long problem8(int adjacentDigits) {
        String number =
                "73167176531330624919225119674426574742355349194934"+
                "96983520312774506326239578318016984801869478851843"+
                "85861560789112949495459501737958331952853208805511"+
                "12540698747158523863050715693290963295227443043557"+
                "66896648950445244523161731856403098711121722383113"+
                "62229893423380308135336276614282806444486645238749"+
                "30358907296290491560440772390713810515859307960866"+
                "70172427121883998797908792274921901699720888093776"+
                "65727333001053367881220235421809751254540594752243"+
                "52584907711670556013604839586446706324415722155397"+
                "53697817977846174064955149290862569321978468622482"+
                "83972241375657056057490261407972968652414535100474"+
                "82166370484403199890008895243450658541227588666881"+
                "16427171479924442928230863465674813919123162824586"+
                "17866458359124566529476545682848912883142607690042"+
                "24219022671055626321111109370544217506941658960408"+
                "07198403850962455444362981230987879927244284909188"+
                "84580156166097919133875499200524063689912560717606"+
                "05886116467109405077541002256983155200055935729725"+
                "71636269561882670428252483600823257530420752963450" ;

        long largestProductByNow = 0 ;
        for (int i = 0; i < number.length() - adjacentDigits; i++) {
            long currentProduct = 1 ;
            for (int j = i; j < i + adjacentDigits; j++) {
                currentProduct *= Integer.valueOf(String.valueOf(number.charAt(j))) ;
            }
            if (currentProduct > largestProductByNow) largestProductByNow = currentProduct ;
        }
        return largestProductByNow ;
    }

    private static boolean isPythagoreanTriplet(int a, int b, int c) {
        if (Math.pow(a,2) + Math.pow(b, 2) == Math.pow(c, 2)) {
            return true ;
        }
        return false ;
    }

    public static long problem9() {
        for (int a = 3; a <= 998; a++) {
            for (int b = a +1; b <= 999; b++) {
                for (int c = b + 1; c <= 1000; c++) {
                    if (isPythagoreanTriplet(a, b, c)) {
                        if (a+b+c==1000) {
                            System.out.println(a + " " + b + " " + c);
                            return a*b*c ;
                        }
                    }
                }
            }
        }
        return 0 ;
    }

    public static long problem10(long upperBoundary) {
        return LongStream.range(2, upperBoundary+1).filter(i -> Utils.isPrime(i)).sum() ;
    }

    public static long problem11() {
        int[] a1 = new int[] {8,02,22,97,38,15,00,40,00,75,04,05,07,78,52,12,50,77,91,8} ;

        int[][] matrix = new int[][] {{8,2,22,97,38,15,00,40,00,75,04,05,07,78,52,12,50,77,91,8},
                {49,49,99,40,17,81,18,57,60,87,17,40,98,43,69,48,04,56,62,00},
                {81,49,31,73,55,79,14,29,93,71,40,67,53,88,30,03,49,13,36,65},
                {52,70,95,23,04,60,11,42,69,24,68,56,01,32,56,71,37,02,36,91},
                {22,31,16,71,51,67,63,89,41,92,36,54,22,40,40,28,66,33,13,80},
                {24,47,32,60,99,03,45,02,44,75,33,53,78,36,84,20,35,17,12,50},
                {32,98,81,28,64,23,67,10,26,38,40,67,59,54,70,66,18,38,64,70},
                {67,26,20,68,02,62,12,20,95,63,94,39,63,8,40,91,66,49,94,21},
                {24,55,58,05,66,73,99,26,97,17,78,78,96,83,14,88,34,89,63,72},
                {21,36,23,9,75,00,76,44,20,45,35,14,00,61,33,97,34,31,33,95},
                {78,17,53,28,22,75,31,67,15,94,03,80,04,62,16,14,9,53,56,92},
                {16,39,05,42,96,35,31,47,55,58,88,24,00,17,54,24,36,29,85,57},
                {86,56,00,48,35,71,89,07,05,44,44,37,44,60,21,58,51,54,17,58},
                {19,80,81,68,05,94,47,69,28,73,92,13,86,52,17,77,04,89,55,40},
                {04,52,8,83,97,35,99,16,07,97,57,32,16,26,26,79,33,27,98,66},
                {88,36,68,87,57,62,20,72,03,46,33,67,46,55,12,32,63,93,53,69},
                {04,42,16,73,38,25,39,11,24,94,72,18,8,46,29,32,40,62,76,36},
                {20,69,36,41,72,30,23,88,34,62,99,69,82,67,59,85,74,04,36,16},
                {20,73,35,29,78,31,90,01,74,31,49,71,48,86,81,16,23,57,05,54},
                {01,70,54,71,83,51,54,69,16,92,33,48,61,43,52,01,89,19,67,48}} ;

        long largestProduct = 0 ;
        for (int i = 0; i < matrix.length-3; i++) {
            for (int j = 0; j < matrix.length-3; j++) {
                //Check for horizontal
                long hProduct = 1;
                for (int k = 0; k < 4; k++) {
                    hProduct *= matrix[i][j+k] ;
                }
                long vProduct = 1 ;
                for (int k = 0; k < 4; k++) {
                    vProduct *= matrix[i+k][j] ;
                }
                long diagProduct = 1 ;
                for (int k =0; k < 4; k++) {
                    diagProduct *= matrix[i+k][j+k] ;
                }
                long revDiagProduct = 1;
                for (int k = 0; k < 4; k++) {
                    revDiagProduct *= matrix[i+3-k][j+k];
                }

                if (hProduct > largestProduct) {
                    largestProduct = hProduct;
                }
                if (vProduct > largestProduct) {
                    largestProduct = vProduct ;
                }
                if (diagProduct > largestProduct) {
                    largestProduct = diagProduct ;
                }
                if (revDiagProduct > largestProduct) largestProduct = revDiagProduct ;


            }
        }

        return largestProduct ;
    }

    public static long problem12(int numberOfWantedFactors) {
        int n = 1;
        int currentNumber = 1 ;
        while (true) {
            if (Utils.getNumberOfDivisors(currentNumber) > numberOfWantedFactors) {
                return currentNumber ;
            }
            n++ ;
            currentNumber += n;
        }
    }



    public static void main(String[] args) {

        //System.out.println(problem3(600851475143L));
        //System.out.println(problem4());
        //System.out.println(problem7(10001));
        //System.out.println(problem8(13));
        //System.out.println(problem10(2000000));
        //System.out.println(problem11()) ;
        System.out.println(problem12(500));


    }


}
