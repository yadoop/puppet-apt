# ppa.pp

define apt::ppa(

) {

    include apt

    exec { "apt-update-${name}":
        command     => "${apt::provider} update",
        refreshonly => true,
    }

    exec { "add-apt-repository-${name}":
        command => "/usr/bin/add-apt-repository ${name}",
        notify  => Exec["apt-update-${name}"],
    }

}
