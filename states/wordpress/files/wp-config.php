<?php
/**
 * The base configuration for WordPress
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

define('FORCE_SSL_ADMIN', True);
define('ABSPATH', dirname(__FILE__) . '/wp');
define('WP_SITEURL', 'https://'.$_SERVER['SERVER_NAME']);
define('WP_CONTENT_DIR', dirname(__FILE__) . '/content');
define('WP_CONTENT_URL', WP_SITEURL . '/content');
define('WP_PLUGIN_DIR', WP_CONTENT_DIR . '/plugins');
define('WP_PLUGIN_URL', WP_CONTENT_URL . '/plugins' );

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', '{{ pillar.wordpress.db_name }}');

/** MySQL database username */
define('DB_USER', '{{ pillar.wordpress.db_user }}');

/** MySQL database password */
define('DB_PASSWORD', '{{ pillar.wordpress.db_password }}');

/** MySQL hostname */
define('DB_HOST', '{{ pillar.wordpress.db_host }}');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', '{{ pillar.mysql.default_character_set }}');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '{{ pillar.mysql.default_collate }}');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '{{ pillar.wordpress.auth_key }}');
define('SECURE_AUTH_KEY',  '{{ pillar.wordpress.secure_auth_key }}');
define('LOGGED_IN_KEY',    '{{ pillar.wordpress.logged_in_key }}');
define('NONCE_KEY',        '{{ pillar.wordpress.nonce_key }}');
define('AUTH_SALT',        '{{ pillar.wordpress.auth_salt }}');
define('SECURE_AUTH_SALT', '{{ pillar.wordpress.secure_auth_salt }}');
define('LOGGED_IN_SALT',   '{{ pillar.wordpress.logged_in_salt }}');
define('NONCE_SALT',       '{{ pillar.wordpress.nonce_salt }}');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', {{ pillar.wordpress.wp_debug }});

/* Multisite */
define('MULTISITE', {{ pillar.wordpress.multisite }});
define('SUBDOMAIN_INSTALL', {{ pillar.wordpress.subdomain_install }});
define('DOMAIN_CURRENT_SITE', '{{ pillar.wordpress.domain_current_site }}');
define('PATH_CURRENT_SITE', '{{ pillar.wordpress.path_current_site }}');
define('SITE_ID_CURRENT_SITE', {{ pillar.wordpress.site_id_current_site }});
define('BLOG_ID_CURRENT_SITE', {{ pillar.wordpress.blog_id_current_site }});
define 'SUNRISE', '{{ pillar.wordpress.sunrise }}');

define( 'DISALLOW_FILE_MODS', True );

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
