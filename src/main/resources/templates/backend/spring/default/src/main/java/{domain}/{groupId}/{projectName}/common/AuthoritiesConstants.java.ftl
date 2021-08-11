package ${config.domain}.${config.groupId}.${config.projectName}.${config.common};
public final class AuthoritiesConstants {

<#list roles as role>

    public static final String ${role.name} = "ROLE_${role.name?upper_case}";

</#list>
    public static final String anonymous = "ROLE_ANONYMOUS";


}
