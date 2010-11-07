<?php

/**
 * BasesfGuardUserProfile
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $user_id
 * @property varchar $nickname
 * @property string $first_name
 * @property string $last_name
 * @property date $birthday
 * @property string $facebook_uid
 * @property string $email
 * @property string $email_hash
 * @property sfGuardUser $sfGuardUser
 * @property Doctrine_Collection $OwnedMatches
 * @property Doctrine_Collection $Teams
 * @property Doctrine_Collection $TeamPlayers
 * 
 * @method integer             getUserId()       Returns the current record's "user_id" value
 * @method varchar             getNickname()     Returns the current record's "nickname" value
 * @method string              getFirstName()    Returns the current record's "first_name" value
 * @method string              getLastName()     Returns the current record's "last_name" value
 * @method date                getBirthday()     Returns the current record's "birthday" value
 * @method string              getFacebookUid()  Returns the current record's "facebook_uid" value
 * @method string              getEmail()        Returns the current record's "email" value
 * @method string              getEmailHash()    Returns the current record's "email_hash" value
 * @method sfGuardUser         getSfGuardUser()  Returns the current record's "sfGuardUser" value
 * @method Doctrine_Collection getOwnedMatches() Returns the current record's "OwnedMatches" collection
 * @method Doctrine_Collection getTeams()        Returns the current record's "Teams" collection
 * @method Doctrine_Collection getTeamPlayers()  Returns the current record's "TeamPlayers" collection
 * @method sfGuardUserProfile  setUserId()       Sets the current record's "user_id" value
 * @method sfGuardUserProfile  setNickname()     Sets the current record's "nickname" value
 * @method sfGuardUserProfile  setFirstName()    Sets the current record's "first_name" value
 * @method sfGuardUserProfile  setLastName()     Sets the current record's "last_name" value
 * @method sfGuardUserProfile  setBirthday()     Sets the current record's "birthday" value
 * @method sfGuardUserProfile  setFacebookUid()  Sets the current record's "facebook_uid" value
 * @method sfGuardUserProfile  setEmail()        Sets the current record's "email" value
 * @method sfGuardUserProfile  setEmailHash()    Sets the current record's "email_hash" value
 * @method sfGuardUserProfile  setSfGuardUser()  Sets the current record's "sfGuardUser" value
 * @method sfGuardUserProfile  setOwnedMatches() Sets the current record's "OwnedMatches" collection
 * @method sfGuardUserProfile  setTeams()        Sets the current record's "Teams" collection
 * @method sfGuardUserProfile  setTeamPlayers()  Sets the current record's "TeamPlayers" collection
 * 
 * @package    tp-taller
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BasesfGuardUserProfile extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('sf_guard_user_profile');
        $this->hasColumn('user_id', 'integer', 5, array(
             'type' => 'integer',
             'notnull' => true,
             'length' => 5,
             ));
        $this->hasColumn('nickname', 'varchar', 32, array(
             'type' => 'varchar',
             'length' => 32,
             ));
        $this->hasColumn('first_name', 'string', 30, array(
             'type' => 'string',
             'length' => 30,
             ));
        $this->hasColumn('last_name', 'string', 30, array(
             'type' => 'string',
             'length' => 30,
             ));
        $this->hasColumn('birthday', 'date', null, array(
             'type' => 'date',
             ));
        $this->hasColumn('facebook_uid', 'string', 20, array(
             'type' => 'string',
             'length' => 20,
             ));
        $this->hasColumn('email', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('email_hash', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));


        $this->index('facebook_uid_index', array(
             'fields' => 
             array(
              0 => 'facebook_uid',
             ),
             'unique' => true,
             ));
        $this->index('email_index', array(
             'fields' => 
             array(
              0 => 'email',
             ),
             'unique' => true,
             ));
        $this->index('email_hash_index', array(
             'fields' => 
             array(
              0 => 'email_hash',
             ),
             'unique' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('sfGuardUser', array(
             'local' => 'user_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $this->hasMany('Match as OwnedMatches', array(
             'local' => 'id',
             'foreign' => 'owner_id'));

        $this->hasMany('Team as Teams', array(
             'refClass' => 'TeamPlayer',
             'local' => 'player_id',
             'foreign' => 'team_id'));

        $this->hasMany('TeamPlayer as TeamPlayers', array(
             'local' => 'id',
             'foreign' => 'player_id'));
    }
}