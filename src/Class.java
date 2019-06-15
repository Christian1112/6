public class Class {

    private int id;
    private String className;


    public Class(int id, String className) {
        this.id = id;
        this.className = className;
    }

    public void setId(int id) {
        this.id = id;
    }
    public int getId() {
        return this.id;
    }

    public void setClassName(String className) {
        this.className = className;
    }
    public String getClassName() {
        return this.className;
    }

    @Override
    public String toString() {
        return className;
    }
}

