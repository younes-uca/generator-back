package ma.zs.generator.engine.bean;

public class Type implements Comparable<Type> {

    private String simpleName;
    private String name;

    public Type(String simpleName) {
        super();
        this.simpleName = simpleName;
        this.name = simpleName;
    }

    public Type() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSimpleName() {
        return simpleName;
    }

    public void setSimpleName(String simpleName) {
        this.simpleName = simpleName;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((simpleName == null) ? 0 : simpleName.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Type other = (Type) obj;
        if (simpleName == null) {
            if (other.simpleName != null)
                return false;
        } else if (!simpleName.equals(other.simpleName))
            return false;
        return true;
    }

    @Override
    public int compareTo(Type o) {
        return this.simpleName.compareTo(o.simpleName);
    }
}
