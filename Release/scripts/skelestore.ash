void main()
{
	item daily_special_item = get_property("_crimboPastDailySpecialItem").to_item();
	int daily_special_price = get_property("_crimboPastDailySpecialPrice").to_int();
	int knucklebones = item_amount($item[knucklebone]);
	int price_low;
	int price_high;
	boolean has_skill;
	skill item_skill = daily_special_item.skill;
	boolean is_hatchling = false;
	boolean good_price = false;
	boolean need_item = false;

	print("Today's item is: " + daily_special_item + " at " + daily_special_price + " knucklebones.", "blue");
	print("You have " + knucklebones + " knucklebones to spend.", "blue");
	print("");

	if (daily_special_price > 1500)
	{
		if (daily_special_price > 2500)
		{
			price_low = 2501;
			price_high = 3000;
		} else
		{
			price_low = 1501;
			price_high = 2500;
		}
	} else
	{
		if (daily_special_price > 500)
		{
			price_low = 501;
			price_high = 1500;
		} else if (daily_special_price > 100)
		{
			price_low = 101;
			price_high = 500;
		} else
		{
			price_low = 10;
			price_high = 100;
		}
	}

	if (daily_special_price < (price_low + (price_high - price_low)*.33)) 
	{
		print("This is a good price for this item", "green");
		good_price = true;
	} else if (daily_special_price > (price_low + (price_high - price_low)*.66))
	{
		print("This is a bad price for this item", "red");
	} else
	{
		print("This is an average price for this item", "orange");
	}

	print("");

	if (item_skill.id == -1) 
	{
		has_skill = false;
	} else
	{
		has_skill = true;
	}

	if (item_amount(daily_special_item) > 0) 
	{
		print("Inventory count: " + item_amount(daily_special_item), "green");
	} else
	{
		if (has_skill == true)
		{
			if (have_skill(item_skill)) 
			{
				print("You already have the skill " + item_skill, "green");
			} else
			{
				print("You do not have the skill " + item_skill, "red");
				need_item = true;
			}
		} else
		{
			for i from 1 to 332 
			{
				if (to_familiar(i).hatchling == daily_special_item)
				{
					is_hatchling = true;
					print("This seems to be a hatchling for " + to_familiar(i), "blue");
					if (have_familiar(to_familiar(i)))
					{
						print("You already have the familiar " + to_familiar(i), "green");
					} else
					{
						print("You do not have the familiar " + to_familiar(i), "green");
						need_item = true;
					}
				}
			}
			if (is_hatchling == false)
			{
				print("You do not have this item in your inventory", "red");
				need_item = true;
			}
		}
	}


	if (!daily_special_item.tradeable)
	{
		print("This item is untradeable", "orange");
	} else 
	{
		int price = mall_price(daily_special_item);
		print("It is currently selling for " + price + " meat", "blue");
		print("That's " + (price / daily_special_price) + " meat per bone.", "blue");
	}

	if (
		(good_price == true) &&
		(need_item == true) &&
		(daily_special_price < knucklebones)
		)
	{
		if (user_confirm("Would you like to buy the special item?"))
		{
			buy($coinmaster[Skeleton of Crimbo Past], 1, daily_special_item);
			if (get_property("_crimboPastDailySpecial") == true)
			{
				print("Successfully purchased today's special item!", "green");
			} else
			{
				print("Purchase unsuccessful, try again manually?", "red");
			}
		}
		// boolean user_confirm(string message ,int timeOutMillis ,boolean defaultValue )
	}
}
