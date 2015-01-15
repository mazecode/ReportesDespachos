<?php namespace App\Util;

/**
 * Class Functions
 *
 * @package App\Util
 */
class Functions
{

	/**
	 * @param $data
	 *
	 * @return string
	 */
	public static function printr($data)
	{
		return "<pre>" . htmlspecialchars(print_r($data, true)) . "</pre>";
	}

	/**
	 * @param $class
	 *
	 * @return mixed
	 */
	public static function getMethods($class)
	{
		$class   = new ReflectionClass($class);
		$methods = $class->getMethods();

		return $methods;
	}

	/**
	 * @param $array
	 *
	 * @return string
	 */
	public static function array_2_csv($array)
	{
		$csv = array();
		foreach ($array as $item) {
			if (is_array($item)) {
				$csv[] = Functions::array_2_csv($item);
			} else {
				$csv[] = $item;
			}
		}

		return implode(';', $csv) . PHP_EOL;
	}

	/**
	 * @param $objeto
	 *
	 * @return mixed
	 */
	public static function objectToArray($objeto)
	{
		return json_decode(json_encode($objeto), true);
	}

	/**
	 * @param array  $files
	 * @param string $destination
	 * @param bool   $overwrite
	 *
	 * @return bool
	 */
	public static function create_zip($files = array(), $destination = '', $overwrite = false)
	{
		if (file_exists($destination) && !$overwrite) {
			return false;
		}

		$valid_files = array();

		if (is_array($files)) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					$valid_files[] = $file;
				}
			}
		}
		if (count($valid_files)) {
			$zip = new \ZipArchive();
			if (!$zip->open($destination, \ZIPARCHIVE::CREATE)) {
				return false;
			}
			foreach ($valid_files as $file) {
				$zip->addFile($file, $file);
			}
			$zip->close();

			return true;
		} else {
			return false;
		}
	}

	/**
	 * @param array         $fields
	 * @param string $delimiter
	 * @param string $enclosure
	 * @param bool          $encloseAll
	 * @param bool          $nullToMysqlNull
	 *
	 * @return string
	 */
	public static function arrayToCsv(array $fields, $delimiter = ';', $enclosure = '"', $encloseAll = false, $nullToMysqlNull = false)
	{
		$delimiter_esc = preg_quote($delimiter, '/');
		$enclosure_esc = preg_quote($enclosure, '/');

		$outputString = "";
		foreach ($fields as $tempFields) {
			$output = array();
			foreach ($tempFields as $field) {
				// ADDITIONS BEGIN HERE
				if (gettype($field) == 'integer' || gettype($field) == 'double') {
					$field = strval($field); // Change $field to string if it's a numeric type
				}
				// ADDITIONS END HERE
				if ($field === null && $nullToMysqlNull) {
					$output[] = 'NULL';
					continue;
				}

				// Enclose fields containing $delimiter, $enclosure or whitespace
				if ($encloseAll || preg_match("/(?:${delimiter_esc}|${enclosure_esc}|\s)/", $field)) {
					$field = $enclosure . str_replace($enclosure, $enclosure . $enclosure, trim($field)) . $enclosure;
				}
				$output[] = trim($field);
			}
			$outputString .= implode($delimiter, $output) . PHP_EOL;
		}

		return $outputString;
	}

	/**
	 * @param array  $fields
	 * @param string $delimiter
	 * @param string $enclosure
	 * @param bool   $encloseAll
	 * @param bool   $nullToMysqlNull
	 *
	 * @return string
	 */
	public static function arrayToCsv2(array $fields, $delimiter = ';', $enclosure = '"', $encloseAll = false, $nullToMysqlNull = false)
	{
		$delimiter_esc = preg_quote($delimiter, '/');
		$enclosure_esc = preg_quote($enclosure, '/');

		$outputString = "";
		$output       = array();
		foreach ($fields as $field) {
			// ADDITIONS BEGIN HERE
			if (gettype($field) == 'integer' || gettype($field) == 'double') {
				$field = strval($field); // Change $field to string if it's a numeric type
			}
			// ADDITIONS END HERE
			if ($field === null && $nullToMysqlNull) {
				$output[] = 'NULL';
				continue;
			}

			// Enclose fields containing $delimiter, $enclosure or whitespace
			if ($encloseAll || preg_match("/(?:${delimiter_esc}|${enclosure_esc}|\s)/", $field)) {
				$field = $enclosure . str_replace($enclosure, $enclosure . $enclosure, trim($field)) . $enclosure;
			}
			$output[] = trim($field);
		}
		$outputString .= implode($delimiter, $output) . PHP_EOL;

		return $outputString;
	}


	public static function getRealIP()
	{
		if ($_SERVER['HTTP_X_FORWARDED_FOR'] != '') {
			$client_ip = (!empty($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : ((!empty($_ENV['REMOTE_ADDR'])) ? $_ENV['REMOTE_ADDR'] : "unknown");

			$entries = split('[, ]', $_SERVER['HTTP_X_FORWARDED_FOR']);

			reset($entries);
			while (list(, $entry) = each($entries)) {
				$entry = trim($entry);
				if (preg_match("/^([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)/", $entry, $ip_list)) {
					// http://www.faqs.org/rfcs/rfc1918.html
					$private_ip = array('/^0\./', '/^127\.0\.0\.1/', '/^192\.168\..*/', '/^172\.((1[6-9])|(2[0-9])|(3[0-1]))\..*/', '/^10\..*/');

					$found_ip = preg_replace($private_ip, $client_ip, $ip_list[1]);

					if ($client_ip != $found_ip) {
						$client_ip = $found_ip;
						break;
					}
				}
			}
		} else {
			$client_ip = (!empty($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : ((!empty($_ENV['REMOTE_ADDR'])) ? $_ENV['REMOTE_ADDR'] : "unknown");
		}

		return $client_ip;

	}

	/**
	 * @return mixed
	 */
	public static function serverData()
	{
		$data['IP'] = $_SERVER['REMOTE_ADDR'];
		if (preg_match('/' . "Netscape" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "Netscape"; elseif (preg_match('/' . "Firefox" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "FireFox";
		elseif (preg_match('/' . "MSIE" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "MSIE";
		elseif (preg_match('/' . "Opera" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "Opera";
		elseif (preg_match('/' . "Konqueror" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "Konqueror";
		elseif (preg_match('/' . "Chrome" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "Chrome";
		elseif (preg_match('/' . "Safari" . '/', $_SERVER["HTTP_USER_AGENT"]))
			$data['BROWSER'] = "Safari";
		else $data['BROWSER'] = "UNKNOWN";

		return $data;
	}
}
