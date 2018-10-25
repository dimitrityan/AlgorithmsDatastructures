import java.util.Arrays;

class MyArrayList {
    int[] myArray;
    int usage = 0;

    public MyArrayList() {
        myArray = new int[1];
        usage = 0;
    }

    boolean add(int element) {
        if (usage == myArray.length) {
            doubleArraySize();
        }
        myArray[usage] = element;
        usage++;
        return true;
    }

    boolean add(int element, int index) {
        if (!isIndexInBounds(index)) {
            throw new IndexOutOfBoundsException("Index is out of bounds");
        }

        if (usage == myArray.length) {
            doubleArraySize();
        }

        int[] copy = Arrays.copyOfRange(myArray, index, myArray.length);

        for (int i = 1; i <= copy.length; i++) {
            myArray[index + i] = copy[i - 1];
        }

        usage++;

        return true;
    }

    int remove(int index) {
        if (!isIndexInBounds(index)) {
            throw new IndexOutOfBoundsException("Index is out of bounds");
        }

        if (usage == 0) {
            return -1;
        }

        usage--;

        if (usage <= (myArray.length / 2)) {
            halfArraySize();
        }

        int toBeRemoved = myArray[index];
        int[] rest = new int[myArray.length];

        for (int i = 0; i < myArray.length; i++) {
            if (i > index) {
                rest[i - index - 1] = myArray[i];
            }
        }

        for (int i = 0; i < rest.length; i++) {
            this.myArray[index + i] = rest[i];
        }

        return toBeRemoved;
    }

    void clear() {
        this.myArray = new int[1];
        usage = 1;
    }

    int size() {
        return usage;
    }

    int get(int index) {
        if (!isIndexInBounds(index)) {
            throw new IndexOutOfBoundsException("Index is out of bounds");
        }

        return myArray[index];
    }

    int set(int index, int element) {
        if (!isIndexInBounds(index)) {
            throw new IndexOutOfBoundsException("Index is out of bounds");
        }

        int previousElement = myArray[index];
        myArray[index] = element;

        return previousElement;
    }

    void doubleArraySize() {
        int[] newArray = new int [myArray.length * 2];
        for (int i = 0; i < myArray.length; i++) {
            newArray[i] = myArray[i];
        }
        this.myArray = newArray;
    }

    void halfArraySize() {
        int[] newArray = new int[myArray.length / 2];

        for (int i = 0; i < (myArray.length / 2); i++) {
            newArray[i] = myArray[i];
        }
        this.myArray = newArray;
    }

    boolean isIndexInBounds(int index) {
        if (index < 0 || index > myArray.length) {
            return false;
        }
        return true;
    }
}
